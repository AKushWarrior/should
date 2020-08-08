A BDD-style assertion library for Dart developers. It has built-in support for most 
common primitives, including Strings, Numbers Functions, Iterables. It also
has type and equality checks built in for all objects.

should is currently in production use in 4 of my projects, and is part of a larger testing framework. This
framework is un-named and under development for open-sourcing. should will, upon that package's release, be
available both bundled and independently. 

## Usage
should is based on OO chains; at the end of the assertion, a reflective operation captures each 'section' of the 
assertion. A simple example:

```dart
import 'package:should/should.dart';

main() {
  var dou = 2.0;

  requireThat(dou).be<int>(); //oops, doubles aren't int --> error

  //but we can put in our own logic --> No error
  unless(dou is double).requireThat(dou).be<int>();

  //doubles are not subclass of int --> No error
  requireThat(dou).not.beSubclassOf<int>();

  // There is three options for type checking:
  // dou.should.be<int> is equivalent to: assert(dou is int).
  // dou.should.beSubclass (dou is an instance of a subclass of given type)
  // or dou.should.instantiate (dou is a direct instance of given type).

  //2.0 == 2.0 && 2.0 != 0--> No error
  requireThat(dou).equal(2.0).and.not.equalAllOf([0, 1, 2, 3, 4]);

  print('evaluated 4 should statements');
}
```

## Matchers
should has specific matchers beyond the general matchers displayed above. (It also has a few other general matchers not
shown above). These are imported through specific libraries. For instance, if I wanted matchers for numbers as well as 
Strings, I would import:
```dart
import 'package:should/should.dart';
import 'package:should/should_num.dart';
import 'package:should/should_string.dart';
```
Documentation for all the matchers will come soon. For now, you can check the API reference all the available matchers (
`Cap` is our name for matchers). 

Matchers are currently available for: Numbers, Strings, Zero-parameter functions, and Iterables.
Matchers are planned for: Parameterized spies, Streams, and Futures.

File an issue if you think there's a matcher type we should support! Or, write your own (see below)!

## Writing Custom Matchers
To write a custom matcher, you'll have to write an extension over BaseShouldObject. Suppose we wanted to check if a num
is negative. We would write an extension like this:
```dart
extension ShouldNumExtension on BaseShouldObject<num> {
  Cap<num> get beNegative {
    var cap = Cap<num>((obj) {
      num n = obj as num; //cast dynamic object to num
      return n < 0;
    }, this, 'be negative');
    finalEval(cap);
    return cap;
  }
}
```
There's a few critical pieces here. the declaration starting with `var cap =` is creating a `Cap` object, which is the
internal representation of a matcher. Cap takes three parameters: a `bool Function(dynamic)`, a `BaseShouldObject`, and
a `String`. The first is your business logic, as seen above. The second is internal; it should **always be `this`**. The last
is the debugging description of this matcher. Imagine the matcher in a sentence to come up with this: `2 should (be negative)`.
To adapt this sample to another type is easy: simply replace the word `num` wherever it appears with your own type.

We could then use our matcher anywhere that both 'package:should/should.dart' and the extension from above have been imported.
```dart
requireThat(-2).beNegative;
```

## should vs. assert
should is meant to be used as a drop-in replacement for `assert`. If assert
would not throw an error, this library does not either. However, this library will print
short error messages to the console regardless of whether assertions are enabled.

This library, in my opinion, is also easier to read than an arbitrary assertion. It follows
the laws of English, which are easier to read intuitively than mathematical lingo.

should additionally has cleaner outputs to the terminal, using some hardcoded psuedo-introspection
 to determine what a failed assertion was attempting to do. For example, the assertion:

```dart
2.0.should.beType<int>();
```
fails in should with the error message:
`Your should assertion failed on line 10: 2.0 should be Type int`, as well as a StackTrace. assert would just give you 
the StackTrace. Note that all stacktraces aren't created equal; take a look at a sample I've compiled for assert:

```
Unhandled exception:
'file:///home/___/___/should/example/generic_example.dart': Failed assertion: line 11 pos 10: 'dou is int': is not true.
#0      _AssertionError._doThrowNew (dart:core-patch/errors_patch.dart:42:39)
#1      _AssertionError._throwNew (dart:core-patch/errors_patch.dart:38:5)
#2      genericExample (file:///home/akishore/IdeaProjects/should/example/generic_example.dart:11:10)
#3      main (file:///home/akishore/IdeaProjects/should/example/generic_example.dart:5:3)
#4      _startIsolate.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:301:19)
#5      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:168:12)
```
vs. should for the equivalent call:
```
┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
│ Your should assertion failed on line 11: 2.0 should be Type int
│ See the StackTrace below for more details...
└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
example/generic_example.dart 11:14              genericExample
example/generic_example.dart 5:3                main
```

Just like with assert, you can enable or disable error-throwing. Use `should.errorOnAssert = true;` to make should throw
errors on failed assertions. Unfortunately, if this is set to true, then you will lose the enhanced, terse StackTraces
from above.

## should vs. expect
`expect` is the assertion method for the built in testing library (https://pub.dev/packages/test). should *will* work in
 these tests, but only if you set `should.errorOnAssert = true`. should will still print the first error message (the 
 introspective one starting with "Your should assertion failed...), but you'll lose the terse stacktrace in exchange for
 whatever the test package gives you.
 
 should vs. expect, on a functional level, are fairly similar. It is mostly a stylistic difference: expect uses a
 Unit Test Matcher style, whereas should uses a BDD style. BDD is more readable but less concise than the style expect
 uses.

## TODO: Where We're Heading
- More tests
- Conjunction support (see: should.js and/or) (`and` conjunctions complete)
- More class integrations (Streams? Futures?)
- Cleaner code documentation and comments
- Simple Spies

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/AKushWarrior/should/issues

###### This library is licensed under the MPL 2.0.