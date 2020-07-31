part of 'function.dart';

class FunctionModifier extends BaseShouldFunction implements Modifier {
  @override
  bool Function(bool) modify;

  @override
  String toStr;

  FunctionModifier(this.modify, obj, parent, this.toStr) : super(obj, parent);
}

class PreFunctionModifier extends FunctionModifier {
  PreFunctionModifier(bool Function(bool p1) modify, obj, parent, toStr)
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
