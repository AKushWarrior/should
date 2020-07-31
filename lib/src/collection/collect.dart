import '../should_statement.dart';

part 'modifier.dart';
part 'extensions.dart';

class BaseShouldIterable<Y> extends BaseShouldObject {
  BaseShouldIterable(Iterable obj, BaseShouldIterable parent)
      : super(obj, parent);

  static BaseShouldIterable _base;

  @override
  IterableModifier get not {
    var not = IterableModifier((bool x) {
      return !x;
    }, obj, this, 'not');
    return not;
  }

  Cap haveLengthOf(int l) {
    var cap = Cap((obj) {
      Iterable temp = obj;
      return temp.length == l;
    }, this, 'have a length of $l');
    finalEval(cap);
    return cap;
  }

  Cap get beEmpty {
    var cap = Cap((obj) {
      Iterable temp = obj;
      return temp.isEmpty;
    }, this, 'be empty');
    finalEval(cap);
    return cap;
  }

  Cap contain(Y element) {
    var cap = Cap((obj) {
      Iterable temp = obj;
      return temp.contains(element);
    }, this, 'be empty');
    finalEval(cap);
    return cap;
  }
}
