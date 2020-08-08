import 'package:should/should.dart';
import 'package:should/should_function.dart';

void main() {
  functionExample();
}

void functionExample() {
  var func = () => 2 + 2;

  requireThat(func).evaluateTo(4);

  requireThat(func).throwType<Error>();

  print('evaluated 2 should statements');
}
