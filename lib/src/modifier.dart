part of 'should_statement.dart';

class Modifier<X> extends BaseShouldObject<X> {
  final bool Function(bool) modify;

  Modifier(this.modify, obj, parent, toStr) : super(obj, parent, toStr);
}

class PreModifier extends Modifier {
  PreModifier(bool Function(bool p1) modify, parent, toStr)
      : super(modify, null, parent, toStr);

  BaseShouldObject<X> requireThat<X extends Object>(X obj) {
    BaseShouldObject._base = BaseShouldObject<X>(obj, this);
    return BaseShouldObject._base;
  }
}
