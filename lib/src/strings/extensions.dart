part of 'strings.dart';

extension StringShouldStatement on String {
  @override
  BaseShouldString get should {
    BaseShouldString._base ??= BaseShouldString(this, null);
    return BaseShouldString._base;
  }

  @override
  PreStringModifier unless(bool cond) {
    BaseShouldString._base ??= BaseShouldString(this, null);
    var mod = PreStringModifier((bool x) {
      if (cond) {
        return true;
      }
      return x;
    }, this, BaseShouldString._base, 'unless (cond: $cond)');
    return mod;
  }
}

extension PreStringStatement on PreStringModifier {
  BaseShouldString get should {
    return BaseShouldString(obj, this);
  }
}
