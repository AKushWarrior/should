part of 'numbers.dart';

class UnfinishedWithin extends BaseShouldObject {
  final num isWithin;
  UnfinishedWithin(obj, parent, this.isWithin) : super(obj, parent);

  Cap<num> of(num other) {
    var cap = Cap<num>((obj) {
      obj = obj >= 0 ? obj : -obj;
      other = other >= 0 ? other : -other;
      return obj > other ? obj - other >= isWithin : other - obj <= isWithin;
    }, parent, 'be within $isWithin of $other');
    finalEval(cap);
    return cap;
  }

  Cap<num> below(num other) {
    var cap = Cap<num>((obj) {
      return other - obj < isWithin;
    }, parent, 'be within $isWithin below $other');
    finalEval(cap);
    return cap;
  }

  Cap<num> above(num other) {
    var cap = Cap<num>((obj) {
      return obj - other < isWithin;
    }, parent, 'be within $isWithin above $other');
    finalEval(cap);
    return cap;
  }

  @override
  void noSuchMethod(Invocation invocation) {
    super.noSuchMethod(invocation);
  }
}
