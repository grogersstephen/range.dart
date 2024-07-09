# Range

Simple package to work with ranges in dart.

A Range has two endpoints denoted by class members 'a' and 'b'.  A DoubleRange and IntRange are provided.

# Instantiation
A Range can be instantiated by providing the endpoints as arguments to a class which extends Range.
```dart
final doubleRange = DoubleRange(3.0, 12.5);
final intRange = IntRange(50, 250);
```

# Getters
## top
Get the endpoint which is ordered after.
## bottom
Get the endpoint which is ordered before.
## isSingular
Returns true if both endpoints are equivalent. More specifically: if both endpoints are ordered together according to `compareTo` from `Comparable`.
## singular
If both endpoints are equivalent, returns that value.  Otherwise, this throws an exception.

# Methods
## bool isInRange(T other, {bool inclusive = true})
Returns true if `other` lies between if other is ordered before the top endpoint and ordered after the bottom endpoint.  If `inclusive` is set to `true`, then `other` may equal the top or bottom endpoint.

# Static Methods
These may help when creating a class to extend `Range`. 
## static double mean(double start, double end)
This returns the center value between two doubles.
## static List<double> points(double start, double end, int count)
Given two doubles and a count, this will return an evenly spaced list of doubles of length `count` including the `start` and `end` values.


# Declaring a Class which extends Range
Any class which implements Comparable may extend Range.
```dart
class AngleRange extends Range<Angle> {
  @override
  final Angle a;
  @override
  final Angle b;
  AngleRange(this.a, this.b);

  Angle get mean => Angle(Range.mean(a.radians, b.radians));

  List<Angle> points(int count) =>
      Range.points(a.radians, b.radians, count).map((e) => Angle(e)).toList();
}
```



