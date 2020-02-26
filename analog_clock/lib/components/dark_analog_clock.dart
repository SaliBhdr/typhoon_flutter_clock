import 'package:flutter/material.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:analog_clock/widgets/pallet.dart';
import 'package:analog_clock/widgets/hex_color.dart';
import 'package:analog_clock/widgets/hour_hand.dart';
import 'package:analog_clock/widgets/minute_hand.dart';
import 'package:analog_clock/widgets/second_hand.dart';
import 'package:analog_clock/widgets/milli_second_hand.dart';


class DarkAnalogClock extends StatelessWidget {
  final DateTime now;
  final String time;
  final BoxConstraints constraints;
  final ThemeData customTheme;
  final ClockModel model;

  DarkAnalogClock(
      {@required this.now,
        @required this.time,
        @required this.model,
        @required this.constraints,
        @required this.customTheme})
      : assert(now != null),
        assert(time != null),
        assert(model != null),
        assert(constraints != null),
        assert(customTheme != null);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Pallet(
        image: 'assets/images/pallet-light.png',
        diameter: constraints.maxHeight * 0.75,
        color: HexColor('#142550'),
        boxShadow: [
          BoxShadow(
            color: HexColor('#101d3d'),
            blurRadius: 10.0,
            spreadRadius: 3,
            offset: Offset(
              20.0, // Move to right 10  horizontally
              0, // Move to bottom 10 Vertically
            ),
          ),
          BoxShadow(
            color: HexColor('#101d3d'),
            blurRadius: 10.0,
            spreadRadius: 3,
            offset: Offset(
              -20.0, // Move to right 10  horizontally
              0, // Move to bottom 10 Vertically
            ),
          ),
        ],
      ),
      Pallet(
        diameter: constraints.maxHeight * 0.55,
        image: 'assets/images/moon.png',
        color: HexColor('#22335d'),
        boxShadow: [
          BoxShadow(
            color: HexColor('EEF1F8'),
            blurRadius: 15.0,
            offset: Offset.fromDirection(20, 10),
          ),
          BoxShadow(
            color: HexColor('EEF1F8'),
            blurRadius: 15.0,
            offset: Offset.fromDirection(22, 10),
          ),
          BoxShadow(
            color: HexColor('EEF1F8'),
            blurRadius: 15.0,
            offset: Offset.fromDirection(18, 10),
          )
        ],
      ),
      MilliSecondHand(
        color: Colors.cyan,
        time: now,
      ),
      SecondHand(
        color: HexColor('#d92d7b'),
        time: now,
      ),
      MinuteHand(
        color: HexColor('#fc8f04'),
        time: now,
      ),
      HourHand(
        is24Format: model.is24HourFormat,
        color: HexColor('#6C316E'),
        time: now,
      ),
    ]);
  }
}
