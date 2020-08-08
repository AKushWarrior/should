import '../should_statement.dart';
import 'package:dartx/dartx.dart';

extension BaseShouldString on BaseShouldObject<String> {
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

  Cap<String> contain(String seg) {
    var cap = Cap<String>((obj) {
      String temp = obj;
      return temp.contains(seg);
    }, this, 'contain the segment "$seg"');
    finalEval(cap);
    return cap;
  }
}
