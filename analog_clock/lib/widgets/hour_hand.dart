import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/mixins/distance_ratio_mixin.dart';
import 'package:analog_clock/widgets/drawn_hand.dart';

class HourHand extends StatelessWidget with DistanceRatioMixin {
  final DateTime time;
  final Color color;
  final bool is24Format;
  final radiansPerTick = radians(360 / 12);

  HourHand({
    @required this.time,
    @required this.color,
    @required this.is24Format,
  })  : assert(time != null),
        assert(is24Format != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    final int minute = this.time.minute;
    final int hour = this.time.hour;

    return DrawnHand(
      color: this.color,
      size: 0.24,
      text: is24Format
          ? hour.toString()
          : DateFormat("h").format(this.time).toString(),
      distanceRatio: getHourDistanceRatio(1.41, hour + (minute / 60)),
      thickness: 4,
      angleRadians: hour * radiansPerTick + minute / 60 * radiansPerTick,
    );
  }
}
