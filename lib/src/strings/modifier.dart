part of 'strings.dart';

class StringModifier extends BaseShouldString implements Modifier {
  @override
  bool Function(bool) modify;

  @override
  String toStr;

  StringModifier(this.modify, obj, parent, this.toStr) : super(obj, parent);
}

class PreStringModifier extends StringModifier {
  PreStringModifier(bool Function(bool p1) modify, obj, parent, toStr)
      : super(modify, obj, parent, toStr);
}
