A BDD-style assertion library for Dart developers. It has built-in support for most 
common primitives, including Strings, Integers, Doubles, Functions, Iterables. It also
has type and equality checks built in for all objects.

should is currently in production use in 4 of my projects, and is part of a larger testing framework. This
framework is un-named and under development for open-sourcing. should will, upon that package's release, be
available both bundled and independently. 

## Usage
should is based on extension methods. A simple example is below. For every available, see
the example folder or API reference.

```dart
import 'package:should/should.dart';

main() {
   var dou = 2.0;
  
   dou.should.be<int>(); //oops, doubles aren't int --> error
  
   //but we can put in our own logic --> No error
   dou.unless(dou is double).should.be<int>();
  
   //doubles are not subclass of int --> No error
   dou.should.not.beSubclassOf<int>();
  
   // There are three options for type checking:
   // dou.should.be<int> is equivalent to: assert(dou is int).
   // dou.should.beSubclass (dou is an instance of a subclass of given type)
   // or dou.should.instantiate (dou is a direct instance of given type).
  
   dou.should.equal(2.0);
}
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
`Your should assertion failed on line 10: 2.0 should be Type int`, as well as a StackTrace.
assert would just give you the StackTrace. Further, if assert is disabled for a given program,
it will not print anything to the terminal. should will still print its error message
if assertions are disabled.

## should vs. expect
`expect` is the assertion method for the built in testing library (https://pub.dev/packages/test).
Currently, should is not interoperable with the test package. should *will* work in tests (print outputs corrrectly)
, but the test package will mark tests with failing should assertions a success. I plan to work on this in
the coming weeks, as should > expect (IMO) for many of the same reasons as should > assert (IMO).


## TODO: Where We're Heading
- More tests
- Code generation for property level checking of custom classes
- Better grammatical abstractions (see: should.js and/or)
- More class integrations (Streams? Futures?)
- Cleaner code documentation and comments
- Simple support for external integration 

## Notes


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

###### This library is licensed under the MPL 2.0.