abstract class Range<T extends Comparable> {
  abstract final T a;
  abstract final T b;

  static double mean(double start, double end) {
    return points(start, end, 3)[1];
  }

  // Return a list of points given a count
  static List<double> points(double start, double end, int count) {
    final result = <double>[];
    final divisionCount = count - 1;
    double point = start; // start at the first point
    final interval = (end - start) / divisionCount;
    print("interval: $interval");
    for (int i = 0; i < divisionCount; i++) {
      result.add(point);
      point += interval;
    }
    result.add(end); // add the last point
    return result;
  }

  bool get isSingular => a.compareTo(b) == 0;
  T get top => a.compareTo(b) > 0 ? a : b;
  T get bottom => a.compareTo(b) < 0 ? a : b;
  bool isInRange(T other) =>
      other.compareTo(top) <= 0 && other.compareTo(bottom) >= 0;

  @override
  String toString() {
    return "Range($a, $b)";
  }
}

class IntRange extends Range<int> {
  @override
  final int a;
  @override
  final int b;
  IntRange(this.a, this.b);

  int get mean => Range.mean(a.toDouble(), b.toDouble()).round();

  List<int> points(int count) => Range.points(a.toDouble(), b.toDouble(), count)
      .map((e) => (e.round()))
      .toList();
}

class DoubleRange extends Range<double> {
  @override
  final double a;
  @override
  final double b;
  DoubleRange(this.a, this.b);

  double get mean => Range.mean(a, b);

  List<double> points(int count) =>
      Range.points(a.toDouble(), b.toDouble(), count);
}
