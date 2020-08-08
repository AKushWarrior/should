import 'package:should/should.dart';
import 'package:should/should_collection.dart';

void main() {
  collectExample();
}

void collectExample() {
  var collect = [1, 2, 3];

  requireThat(collect).not.beEmpty;

  requireThat(collect).contain(2);

  requireThat(collect).haveLengthOf(2); //looks like an error

  print('evaluated 3 should statements');
}
