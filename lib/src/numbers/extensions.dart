part of 'numbers.dart';

extension NumShouldStatement on num {
  BaseShouldNum get should {
    BaseShouldNum._base ??= BaseShouldNum(this, null);
    return BaseShouldNum._base;
  }

  PreNumModifier unless(bool cond) {
    BaseShouldNum._base ??= BaseShouldNum(this, null);
    var mod = PreNumModifier((bool x) {
      if (cond) {
        return true;
      }
      return x;
    }, this, BaseShouldNum._base, 'unless (cond: $cond)');
    return mod;
  }
}

extension PreNumStatement on PreNumModifier {
  BaseShouldNum get should {
    return BaseShouldNum(obj, this);
  }
}
