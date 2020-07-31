import 'package:should/should_string.dart';

void main() {
  stringExample();
}

void stringExample() {
  var word = 'word';

  word.should.beBlank; //uh oh

  word.should.beValidAscii; //Latin1 also works

  word.should.not.haveLengthOf(5);

  word.should.not.beValidInt; //double also works

  word.should.equal('word');

  print('evaluated 5 should statements');
}
