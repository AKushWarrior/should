import 'package:should/should_function.dart';

void main() {
  functionExample();
}

void functionExample() {
  var func = () => 2 + 2;

  func.should.evaluateTo(4);

  func.should.throwType<Error>();

  print('evaluated 2 should statements');
}
