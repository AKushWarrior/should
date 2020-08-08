import '../should_statement.dart';

extension BaseShouldIterable<Y> on BaseShouldObject<Iterable<Y>> {
  Cap<Iterable<Y>> haveLengthOf(int l) {
    var cap = Cap<Iterable<Y>>((obj) {
      Iterable temp = obj;
      return temp.length == l;
    }, this, 'have a length of $l');
    finalEval(cap);
    return cap;
  }

  Cap<Iterable<Y>> get beEmpty {
    var cap = Cap<Iterable<Y>>((obj) {
      Iterable temp = obj;
      return temp.isEmpty;
    }, this, 'be empty');
    finalEval(cap);
    return cap;
  }

  Cap<Iterable<Y>> contain(Y element) {
    var cap = Cap<Iterable<Y>>((obj) {
      Iterable temp = obj;
      return temp.contains(element);
    }, this, 'be empty');
    finalEval(cap);
    return cap;
  }
}
