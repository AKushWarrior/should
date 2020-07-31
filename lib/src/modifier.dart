part of 'should_statement.dart';

class Modifier extends BaseShouldObject {
  final bool Function(bool) modify;

  Modifier(this.modify, obj, parent, toStr) : super(obj, parent, toStr);
}

class PreModifier extends Modifier {
  PreModifier(bool Function(bool p1) modify, obj, parent, toStr)
      : super(modify, obj, parent, toStr);
}
