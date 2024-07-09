import 'package:range/angle.dart';

void main(List<String> arguments) {
  final r = AngleRange(Angle.degrees(90), Angle.degrees(45));

  print("r: $r");
  print("mean: ${r.mean}");
  print("is singular? ${r.isSingular}");
  print("3 count points: ${r.points(3)}");
  final a = Angle.degrees(52);
  print("is a in range?: ${r.isInRange(a)}");
}
