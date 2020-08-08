import 'dart:collection';
import 'package:stack_trace/stack_trace.dart';

import 'error.dart';

part 'modifier.dart';

part 'cap.dart';

BaseShouldObject<X> requireThat<X>(X obj) {
  BaseShouldObject._base = BaseShouldObject<X>(obj, null);

  return BaseShouldObject._base;
}

PreModifier unless(bool cond) {
  var mod = PreModifier((bool x) {
    if (cond) {
      return true;
    }
    return x;
  }, BaseShouldObject._base, 'unless (cond: $cond)');
  return mod;
}

class BaseShouldObject<X> {
  final _obj;
  final BaseShouldObject parent;
  String toStr = 'base should statement';

  BaseShouldObject(this._obj, this.parent, [this.toStr]);

  X get obj => _obj;

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
      StackTrace preserve;
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
        preserve = st;
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
      if (should.errorOnAssert) {
        throw AssertionError();
      } else {
        var tl = Trace.from(preserve).terse.toString().split('\n');
        tl.removeRange(0, 2);
        print(tl.join('\n'));
      }
    }
  }

  Cap<X> instantiate<T>() {
    var be = Cap<X>((obj) => obj.runtimeType == T, this,
        'be an instantiation of Type $T (and not a subclass etc.)');
    finalEval(be);
    return be;
  }

  Cap<X> beSubclassOf<T>() {
    var be = Cap<X>((obj) => obj.runtimeType != T && obj is T, this,
        'be subclass of Type $T');
    finalEval(be);
    return be;
  }

  Cap<X> be<T>() {
    var be = Cap<X>((obj) => obj is T, this, 'be Type $T');
    finalEval(be);
    return be;
  }

  Cap<X> equal(dynamic other) {
    var equal = Cap<X>((obj) => obj == other, this, 'be equal to $other');
    finalEval(equal);
    return equal;
  }

  Cap<X> equalOneOf(Iterable other) {
    var equal =
        Cap<X>((obj) => other.contains(obj), this, 'be equal to one of $other');
    finalEval(equal);
    return equal;
  }

  Cap<X> equalAllOf(Iterable other) {
    var equal = Cap<X>((obj) => other.every((e) => e == obj), this,
        'be equal to all of $other');
    finalEval(equal);
    return equal;
  }

  Modifier<X> get not {
    var not = Modifier<X>((bool x) {
      return !x;
    }, _obj, this, 'not');
    return not;
  }

  @override
  void noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class should {
  static bool errorOnAssert = false;
}
