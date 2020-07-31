import 'package:should/should.dart';
import 'package:test/test.dart';

void main() {
  group('Base', () {
    Object a;
    Object b;

    setUp(() {
      a = 2;
      b = 2.1;
    });

    test('Type tests', () {
      a.should.not.equal(b);

      a.should.be<int>();
      a.should.be<num>();
      a.should.beSubclassOf<num>();
      a.should.instantiate<int>();

      b.should.be<double>();
      b.should.be<num>();
      b.should.beSubclassOf<num>();
      b.should.instantiate<double>();
    });

    test('Grammar tests', () {
      a.should.not.equal(0);
      a.unless(true).should.equal(0);
    });
  });
}
