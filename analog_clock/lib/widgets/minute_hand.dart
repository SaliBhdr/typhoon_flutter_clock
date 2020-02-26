import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/widgets/drawn_hand.dart';
import 'package:analog_clock/mixins/distance_ratio_mixin.dart';

class MinuteHand extends StatelessWidget with DistanceRatioMixin {
  final DateTime time;
  final Color color;
  final radiansPerTick = radians(360 / 60);

  MinuteHand({@required this.time, @required this.color})
      : assert(time != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    final int minute = this.time.minute;

    return DrawnHand(
      color: color,
      size: 0.4,
      distanceRatio: getDefaultDistanceRatio(1.32, minute),
      thickness: 3,
      text: minute.toString(),
      angleRadians: minute * radiansPerTick,
    );
  }
}
