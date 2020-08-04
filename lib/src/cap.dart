part of 'should_statement.dart';

class Cap<T> {
  bool Function(dynamic) logic;
  BaseShouldObject parent;
  String toStr;

  Cap(this.logic, this.parent, this.toStr);

  T get and {
    return parent.obj;
  }
}
