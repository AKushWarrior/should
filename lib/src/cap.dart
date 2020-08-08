part of 'should_statement.dart';

class Cap<T> {
  bool Function(dynamic) logic;
  BaseShouldObject parent;
  String toStr;

  Cap(this.logic, this.parent, this.toStr);

  BaseShouldObject<T> get and {
    return BaseShouldObject<T>(parent.obj, null);
  }
}
