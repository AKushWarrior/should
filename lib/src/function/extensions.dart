part of 'function.dart';

typedef shouldFunc<T> = T Function();

extension FunctionShouldStatement<Y> on shouldFunc<Y> {
  BaseShouldFunction<Y> get should {
    BaseShouldFunction._base ??= BaseShouldFunction<Y>(this, null);
    return BaseShouldFunction._base;
  }

  PreFunctionModifier unless(bool cond) {
    BaseShouldFunction._base ??= BaseShouldFunction(this, null);
    var mod = PreFunctionModifier((bool x) {
      if (cond) {
        return true;
      }
      return x;
    }, this, BaseShouldFunction._base, 'unless (cond: $cond)');
    return mod;
  }
}

extension PreFunctionStatement on PreFunctionModifier {
  BaseShouldFunction get should {
    return BaseShouldFunction(obj, this);
  }
}
