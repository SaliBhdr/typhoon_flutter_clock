import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/widgets/drawn_hand.dart';

class MilliSecondHand extends StatelessWidget {
  final DateTime time;
  final Color color;
  final radiansPerTick = radians(360 / 1000);

  MilliSecondHand({@required this.time, @required this.color})
      : assert(time != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return DrawnHand(
      color: color,
      size: 0.1,
      thickness: 0.8,
      angleRadians: time.millisecond * radiansPerTick,
    );
  }
}
