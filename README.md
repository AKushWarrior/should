A BDD-style assertion library for Dart developers. It has built-in support for most 
common primitives, including Strings, Integers, Doubles, Functions, Iterables. It also
has type and equality checks built in for all objects.

should is currently in production use in 4 of my projects, and is part of a larger testing framework. This
framework is un-named and under development for open-sourcing. should will, upon that package's release, be
available both bundled and independently. 

## Usage
should is based on extension methods. A simple example is below. For every available check, 
see the example folder or API reference.

```dart
import 'package:should/should_num.dart';

main() {
   var ex = Foo();
  
   ex.should.be<Bar>(); //Foo != Bar and isn't a subclass of Bar --> error
  
   //but we can put in our own logic --> No error
   ex.unless(dou is Foo).should.be<Bar>();
  
   //Foo is not a subclass of Bar and instantiates Foo --> No error
   ex.should.not.beSubclassOf<Bar>().and.should.instantiate<Foo>();
  
   // There are three options for type checking:
   // ex.should.be<Foo> is equivalent to: assert(dou is Foo).
   // dou.should.beSubclass<Object> (dou is an instance of a subclass of given type)
   // or dou.should.instantiate<Foo> (dou is a direct instance of given type).
  
   ex.should.equal(Foo()); //(Assuming that we overrode equals) --> no error
}
```

## Object-level extensions vs. Specific extensions
As you may have noticed browsing the examples and API reference, this library has matchers (`Cap`s) for all Objects as well as for
specific types. The Object level-matchers **cannot** be imported along with any of the typed matchers. I agree that this
is absurd; I have filed an issue at https://github.com/dart-lang/language/issues/1127 which details the block in making
this work.

All of the typed matchers can be used together or independently. Until that blocking issue is resolved,
I plan on writing as many matchers as possible (and enabling users to write matchers) so the Object-level matchers
are unnecessary.

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
- Code generation for property level checking of custom classes
- Conjunction support (see: should.js and/or) (`and` conjunctions complete)
- More class integrations (Streams? Futures?)
- Cleaner code documentation and comments
- Simple support for external integration 

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/AKushWarrior/should/issues

###### This library is licensed under the MPL 2.0.