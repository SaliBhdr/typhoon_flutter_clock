import 'package:flutter/material.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:analog_clock/widgets/pallet.dart';
import 'package:analog_clock/widgets/hex_color.dart';
import 'package:analog_clock/widgets/hour_hand.dart';
import 'package:analog_clock/widgets/minute_hand.dart';
import 'package:analog_clock/widgets/second_hand.dart';
import 'package:analog_clock/widgets/milli_second_hand.dart';

class LightAnalogClock extends StatelessWidget {
  final DateTime now;
  final String time;
  final BoxConstraints constraints;
  final ThemeData customTheme;
  final ClockModel model;

  LightAnalogClock(
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
        image: 'assets/images/pallet-dark.png',
        diameter: constraints.maxHeight * 0.75,
        color: customTheme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: HexColor('E5ECF9'),
            blurRadius: 15.0,
            offset: Offset.fromDirection(20, 12),
          )
        ],
      ),
      Pallet(
        diameter: constraints.maxHeight * 0.55,
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [customTheme.highlightColor, Colors.white],
        ),
        boxShadow: [
          BoxShadow(
            color: HexColor('EDF0F7'),
            blurRadius: 10.0,
            offset: Offset.fromDirection(22, 8),
          ),
          BoxShadow(
            color: HexColor('EDF0F7'),
            blurRadius: 10.0,
            offset: Offset.fromDirection(19, 8),
          ),
        ],
      ),
      Pallet(
        diameter: constraints.maxHeight * 0.20,
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [Colors.white, customTheme.highlightColor],
        ),
        boxShadow: [
          BoxShadow(
            color: HexColor('EEF1F8'),
            blurRadius: 15.0,
            offset: Offset.fromDirection(20, 10),
          )
        ],
      ),
      MilliSecondHand(
        color: Colors.cyan,
        time: now,
      ),
      SecondHand(
        color: HexColor('ff2525'),
        time: now,
      ),
      MinuteHand(
        color: HexColor('975A99'),
        time: now,
      ),
      HourHand(
        is24Format: model.is24HourFormat,
        color: HexColor('fc8f04'),
        time: now,
      ),
    ]);
  }
}
