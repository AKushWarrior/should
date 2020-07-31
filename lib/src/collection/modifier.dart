part of 'collect.dart';

class IterableModifier extends BaseShouldIterable implements Modifier {
  @override
  bool Function(bool) modify;

  @override
  String toStr;

  IterableModifier(this.modify, obj, parent, this.toStr) : super(obj, parent);
}

class PreIterableModifier extends IterableModifier {
  PreIterableModifier(bool Function(bool p1) modify, obj, parent, toStr)
      : super(modify, obj, parent, toStr);
}

/*
class UnfinishedWithin extends BaseShouldObject {
  final num isWithin;
  UnfinishedWithin(obj, parent, this.isWithin) : super(obj, parent);

  Cap of (num other) {
    var cap = Cap((obj) {
      obj = obj >= 0 ? obj : -obj;
      other = other >= 0 ? obj : -obj;
      return obj > other ? obj - other >= isWithin : other - obj <= isWithin;
    }, parent, 'be within $isWithin of $other');
    finalEval(cap);
    return cap;
  }

  @override
  void noSuchMethod(Invocation invocation) {
    super.noSuchMethod(invocation);
  }
}
*/
