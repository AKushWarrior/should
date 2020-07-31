part of 'should_statement.dart';

class Cap {
  bool Function(dynamic) logic;
  BaseShouldObject parent;
  String toStr;

  Cap(this.logic, this.parent, this.toStr);
}
