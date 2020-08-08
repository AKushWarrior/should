import 'package:should/should.dart';
import 'package:test/test.dart';

void main() {
  group('Base', () {
    Object a;
    Object b;

    setUp(() {
      a = 2;
      b = 2.1;
      should.errorOnAssert = true;
    });

    test('Type tests', () {
      requireThat(a).be<int>();
      requireThat(a).be<num>();
      requireThat(a).beSubclassOf<num>();
      requireThat(a).instantiate<int>();

      requireThat(a).be<double>();
      requireThat(a).be<num>();
      requireThat(a).beSubclassOf<num>();
      requireThat(a).instantiate<double>();
    });

    test('Grammar tests', () {
      requireThat(a).not.equal(0);
      unless(true).requireThat(a).equal(0);
      requireThat(a).equal(0).and.be<double>();
    });

    test('Equality tests', () {
      requireThat(a).not.equal(0);
      requireThat(a).equal(2.0);
      requireThat(a).equalOneOf([2, 1, 4, 8]);
    });
  });
}
