import 'package:should/should.dart';

void main() {
  genericExample();
}

void genericExample() {
  var dou = 2.0;

  dou.should.be<int>(); //oops, doubles aren't int --> error

  //but we can put in our own logic --> No error
  dou.unless(dou is double).should.be<int>();

  //doubles are not subclass of int --> No error
  dou.should.not.beSubclassOf<int>();

  // There is three options for type checking:
  // dou.should.be<int> is equivalent to: assert(dou is int).
  // dou.should.beSubclass (dou is an instance of a subclass of given type)
  // or dou.should.instantiate (dou is a direct instance of given type).

  dou.should.equal(2.0); //2.0 == 2.0 --> No error

  print('evaluated 4 should statements');
}
