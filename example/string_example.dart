import 'package:should/should.dart';
import 'package:should/should_string.dart';

void main() {
  stringExample();
}

void stringExample() {
  var z = 'word';

  requireThat(z).beBlank; //uh oh

  requireThat(z).beValidAscii; //Latin1 also works

  requireThat(z).not.haveLengthOf(5);

  requireThat(z).not.beValidInt.and.not.beBlank; //double also works

  requireThat(z).equal('word');

  print('evaluated 5 should statements');
}
