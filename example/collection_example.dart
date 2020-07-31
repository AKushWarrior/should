import 'package:should/should_collection.dart';

void main() {
  collectExample();
}

void collectExample() {
  var collect = [1, 2, 3];

  collect.should.not.beEmpty;

  collect.should.contain(2);

  collect.should.haveLengthOf(2); //looks like an error

  print('evaluated 3 should statements');
}
