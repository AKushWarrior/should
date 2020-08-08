import '../should_statement.dart';
import 'dart:math';

part 'modifier.dart';

extension BaseShouldNum on BaseShouldObject<num> {
  Cap<num> beGreaterThan(num other) {
    var cap = Cap<num>((obj) {
      var n = obj;
      return n > other;
    }, this, 'be greater than other');
    finalEval(cap);
    return cap;
  }

  Cap<num> beLessThan(num other) {
    var cap = Cap<num>((obj) {
      var n = obj;
      return n < other;
    }, this, 'be less than other');
    finalEval(cap);
    return cap;
  }

  Cap<num> beLessThanOrEqualTo(num other) {
    var cap = Cap<num>((obj) {
      var n = obj;
      return n <= other;
    }, this, 'be less than or equal to other');
    finalEval(cap);
    return cap;
  }

  Cap<num> beGreaterThanOrEqualTo(num other) {
    var cap = Cap<num>((obj) {
      var n = obj;
      return n >= other;
    }, this, 'be greater than or equal to other');
    finalEval(cap);
    return cap;
  }

  Cap<num> get bePowerOfTwo {
    var cap = Cap<num>((obj) {
      var n = obj;
      if (!(n % 1 == 0.0)) {
        return false;
      }
      n = n.toInt();
      return _log(2, n).ceil() == _log(2, n).floor();
    }, this, 'be a power of two');
    finalEval(cap);
    return cap;
  }

  double _log(int base, int of) => log(of) / log(base);

  Cap<num> get bePrime {
    var cap = Cap<num>((obj) {
      var n = obj;
      if (!(n % 1 == 0.0)) {
        return false;
      } else {
        n = n.toInt();
        if (n == 2 || n == 3 || n == 5) {
          return true;
        }
        if (n < 2 || n % 2 == 0 || n % 3 == 0 || n % 5 == 0) {
          return false;
        }
        if (n < 25) {
          return true;
        }
        var d = n - 1, s = 0;
        while (d % 2 == 0) {
          d ~/= 2;
          s++;
        }
        loop:
        for (final a in [2, 3, 5, 7, 11, 13, 17]) {
          var x = a.modPow(d, n);
          if (x == 1 || x == n - 1) {
            continue loop;
          }
          for (var r = 0; r <= s - 1; r++) {
            x = x.modPow(2, n);
            if (x == 1) {
              return false;
            }
            if (x == n - 1) {
              continue loop;
            }
          }
          return false;
        }
        return true;
      }
    }, this, 'be a prime number');
    finalEval(cap);
    return cap;
  }

  Cap<num> get beMathematicalInt {
    var cap = Cap<num>((obj) {
      var n = obj;
      return n % 1 == 0.0;
    }, this, 'be a mathematical integer');
    finalEval(cap);
    return cap;
  }

  UnfinishedWithin beWithin(num distance) {
    return UnfinishedWithin(obj, parent, distance);
  }
}
