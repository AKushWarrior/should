import 'package:should/should_string.dart';

void main() {
  stringExample();
}

void stringExample() {
  var z = 'word';

  z.should.beBlank; //uh oh

  z.should.beValidAscii; //Latin1 also works

  z.should.not.haveLengthOf(5);

  z.should.not.beValidInt.and.should.not.beBlank; //double also works

  z.should.equal('word');

  print('evaluated 5 should statements');
}
