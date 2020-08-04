import '../should_statement.dart';
import 'package:dartx/dartx.dart';

part 'modifier.dart';
part 'extensions.dart';

class BaseShouldString extends BaseShouldObject {
  BaseShouldString(String obj, BaseShouldString parent) : super(obj, parent);

  static var _base;

  Cap<String> get beBlank {
    var cap = Cap<String>((obj) {
      String temp = obj;
      return temp.isBlank;
    }, this, 'be blank (either length=0 or all whitespace)');
    finalEval(cap);
    return cap;
  }

  Cap<String> get beValidAscii {
    var cap = Cap<String>((obj) {
      String temp = obj;
      return temp.isAscii;
    }, this, 'be a valid ascii String');
    finalEval(cap);
    return cap;
  }

  Cap<String> get beValidLatin1 {
    var cap = Cap<String>((obj) {
      String temp = obj;
      return temp.isLatin1;
    }, this, 'be a valid Latin1 String');
    finalEval(cap);
    return cap;
  }

  Cap<String> get beValidInt {
    var cap = Cap<String>((obj) {
      String temp = obj;
      return temp.isInt;
    }, this, 'be a valid integer');
    finalEval(cap);
    return cap;
  }

  Cap<String> get beValidDouble {
    var cap = Cap<String>((obj) {
      String temp = obj;
      return temp.isDouble;
    }, this, 'be a valid double');
    finalEval(cap);
    return cap;
  }

  Cap<String> haveLengthOf(int l) {
    var cap = Cap<String>((obj) {
      String temp = obj;
      return temp.length == l;
    }, this, 'have a length of $l');
    finalEval(cap);
    return cap;
  }

  @override
  StringModifier get not {
    var not = StringModifier((bool x) {
      return !x;
    }, obj, this, 'not');
    return not;
  }
}
