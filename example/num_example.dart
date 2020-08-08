import 'package:should/should_num.dart';
import 'package:should/should.dart';

void main() {
  numExample();
}

void numExample() {
  var num = 2;

  requireThat(num).beMathematicalInt;

  requireThat(num).bePrime.and.bePowerOfTwo;

  requireThat(num).beWithin(4).of(8); //uh oh

  requireThat(num).equal(2.0);

  print('evaluated 4 should statements');
}
