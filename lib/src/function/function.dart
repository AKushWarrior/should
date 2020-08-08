import '../should_statement.dart';

typedef shouldFunc<Y> = Y Function();

extension BaseShouldFunction<Y> on BaseShouldObject<shouldFunc<Y>> {
  Cap<shouldFunc<Y>> throwType<err>() {
    var cap = Cap<shouldFunc<Y>>((obj) {
      Function n = obj;
      try {
        n();
        return false;
      } catch (thrown) {
        if (thrown is err) {
          return true;
        }
        return false;
      }
    }, this, 'throw an error with type: $err');
    finalEval(cap);
    return cap;
  }

  Cap<shouldFunc<Y>> evaluateTo(Y result) {
    var cap = Cap<shouldFunc<Y>>((obj) {
      Function n = obj;
      try {
        Y attempt = n();
        return attempt == result;
      } catch (thrown) {
        return false;
      }
    }, this, 'return a result of $result');
    finalEval(cap);
    return cap;
  }

  Cap<shouldFunc<Y>> evaluateToOneOf(Iterable<Y> results) {
    var cap = Cap<shouldFunc<Y>>((obj) {
      Function n = obj;
      try {
        Y attempt = n();
        return results.contains(attempt);
      } catch (thrown) {
        return false;
      }
    }, this, 'return a result which equals one of: $results');
    finalEval(cap);
    return cap;
  }
}
