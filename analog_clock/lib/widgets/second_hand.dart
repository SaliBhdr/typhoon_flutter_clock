import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/widgets/drawn_hand.dart';
import 'package:analog_clock/mixins/distance_ratio_mixin.dart';

class SecondHand extends StatelessWidget with DistanceRatioMixin {
  final DateTime time;
  final Color color;
  final double radiansPerTick = radians(360 / 60);

  SecondHand({@required this.time, @required this.color})
      : assert(time != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    final int second = this.time.second;
    return DrawnHand(
      color: color,
      size: 0.62,
      thickness: 2,
      distanceRatio: getDefaultDistanceRatio(1.32, second),
      text: second.toString(),
      angleRadians: second * radiansPerTick,
    );
  }
}
