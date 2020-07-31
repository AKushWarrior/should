import 'package:should/should_num.dart';

void main() {
  numExample();
}

void numExample() {
  var num = 2;

  num.should.beMathematicalInt;

  num.should.bePowerOfTwo;

  num.should.bePrime;

  num.should.beWithin(4).of(8); //uh oh

  num.should.equal(2.0);

  print('evaluated 5 should statements');
}
