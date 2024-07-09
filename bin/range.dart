import 'package:range/range.dart';

void main(List<String> arguments) {
  final r = DoubleRange(3.2999, 3.347);

  print("r: $r");
  print("mean: ${r.mean}");
  print("is singular? ${r.isSingular}");
  print("3 count points: ${r.points(3)}");
  final a = 3.4;
  print("is a in range?: ${r.isInRange(a)}");
  print("is it singular?: ${r.isSingular}");
  print("what is the singular value?: ${r.singular}");
}
