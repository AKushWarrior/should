import 'dart:collection';
import 'error.dart';

part 'modifier.dart';

part 'cap.dart';

part 'transition.dart';

extension Statement on Object {
  BaseShouldObject get should {
    BaseShouldObject._base = BaseShouldObject(this, null);
    return BaseShouldObject._base;
  }

  PreModifier unless(bool cond) {
    BaseShouldObject._base ??= BaseShouldObject(this, null);
    var mod = PreModifier((bool x) {
      if (cond) {
        return true;
      }
      return x;
    }, this, BaseShouldObject._base, 'unless (cond: $cond)');
    return mod;
  }
}

extension PreStatement on PreModifier {
  BaseShouldObject get should {
    return BaseShouldObject(obj, this);
  }
}

class BaseShouldObject {
  final _obj;
  final BaseShouldObject parent;
  String toStr = 'base should statement';

  BaseShouldObject(this._obj, this.parent, [this.toStr]);

  Object get obj => _obj;

  static BaseShouldObject _base;

  void finalEval(Cap cap) {
    var mods = Queue<Modifier>();
    var cur = cap.parent;
    while (cur != null) {
      if (cur is Modifier) {
        mods.addFirst(cur);
      }
      cur = cur.parent;
    }
    var cond = cap.logic(_obj);
    var modStatements = <String>[];
    var premods = <String>[];
    for (var i in mods) {
      cond = i.modify(cond);

      if (i is PreModifier) {
        premods.add(i.toStr);
      } else {
        modStatements.add(i.toStr);
      }
    }

    if (cond == false) {
      var objString = _obj is String ? "'$_obj'" : '$_obj';
      var beginning = premods.isEmpty
          ? '$objString should'
          : '${premods[0]} $objString should';
      var mods = modStatements.join(' ');
      var spacer = modStatements.isEmpty ? '' : ' ';
      int lineNum;
      try {
        throw Error();
      } catch (err, st) {
        var str = st.toString();
        var objLine = str.split('\n')[2];
        var numbers = objLine.split(':')
          ..removeWhere((element) {
            try {
              int.parse(element);
              return false;
            } on FormatException {
              return true;
            }
          });
        lineNum = int.parse(numbers[0]);
      }
      logError('Your should assertion failed on line $lineNum:'
          ' $beginning$spacer$mods ${cap.toStr}'
          '\nSee the StackTrace below for more details...');
      assert(cond);
      try {
        throw AssertionError();
      } catch (err, st) {
        print(st);
      }
    }
  }

  Cap instantiate<T>() {
    var be = Cap((obj) => obj.runtimeType == T, this,
        'be an instantiation of Type $T (and not a subclass etc.)');
    finalEval(be);
    return be;
  }

  Cap beSubclassOf<T>() {
    var be = Cap((obj) => obj.runtimeType != T && obj is T, this,
        'be subclass of Type $T');
    finalEval(be);
    return be;
  }

  Cap be<T>() {
    var be = Cap((obj) => obj is T, this, 'be Type $T');
    finalEval(be);
    return be;
  }

  Cap equal(Object other) {
    var equal = Cap((obj) => obj == other, this, 'be equal to $other');
    finalEval(equal);
    return equal;
  }

  Modifier get not {
    var not = Modifier((bool x) {
      return !x;
    }, _obj, this, 'not');
    return not;
  }

  @override
  void noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
