import '../should_statement.dart';

part 'modifier.dart';
part 'extensions.dart';

class BaseShouldFunction<Y> extends BaseShouldObject {
  BaseShouldFunction(Function obj, BaseShouldFunction parent)
      : super(obj, parent);

  static BaseShouldFunction _base;

  @override
  FunctionModifier get not {
    var not = FunctionModifier((bool x) {
      return !x;
    }, obj, this, 'not');
    return not;
  }

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
}
