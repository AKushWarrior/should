part of 'collect.dart';

extension CollectShouldStatement<Y> on Iterable<Y> {
  BaseShouldIterable<Y> get should {
    BaseShouldIterable._base ??= BaseShouldIterable<Y>(this, null);
    return BaseShouldIterable._base;
  }

  PreIterableModifier unless(bool cond) {
    BaseShouldIterable._base ??= BaseShouldIterable(this, null);
    var mod = PreIterableModifier((bool x) {
      if (cond) {
        return true;
      }
      return x;
    }, this, BaseShouldIterable._base, 'unless (cond: $cond)');
    return mod;
  }
}

extension PreIterableStatement on PreIterableModifier {
  BaseShouldIterable get should {
    return BaseShouldIterable(obj, this);
  }
}
