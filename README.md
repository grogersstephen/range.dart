# Range

Simple package to work with ranges in dart.

A Range has two endpoints which implement `Comparable` denoted by class members 'a' and 'b'. \
Classes DoubleRange and IntRange are provided.

# Instantiation
A Range can be instantiated by providing the endpoints as arguments to a class which extends Range.
```dart
final doubleRange = DoubleRange(3.0, 12.5);
final intRange = IntRange(50, 250);
```

# Getters
#### top
Get the endpoint which is ordered after:
```dart
doubleRange.top // 12.5
```

#### bottom
Get the endpoint which is ordered before:
```dart
doubleRange.bottom // 3.0
```

#### isSingular
Returns true if both endpoints are equivalent.
    More specifically: if both endpoints are ordered together 
        according to `compareTo` from `Comparable`.
```dart
doubleRange.isSingluar // false
```

#### singular
 If both endpoints are equivalent, returns that value.
     Otherwise, this throws an exception.
```dart
doubleRange.singluar // Exception("this range is not singular");
```

# Methods
#### isInRange
```dart
bool isInRange(T other, {bool inclusive = true});
```
```dart
//     Returns true if `other` lies between the two endpoints.
//         If `inclusive` is set to `true`, then `other` may equal either endpoint.
doubleRange.isInRange(5.5) // true
```


# Static Methods
These may help when creating a class to extend `Range`. 
#### mean
This returns the mean value of two doubles.
```dart
static double mean(double start, double end);
```

#### points
Given two doubles and a count, this will return an evenly spaced list of doubles of length `count` including the `start` and `end` values.
```dart
static List<double> points(double start, double end, int count);
```


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



