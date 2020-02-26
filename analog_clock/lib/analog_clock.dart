// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_clock_helper/model.dart';

import 'package:analog_clock/widgets/hex_color.dart';
import 'package:analog_clock/components/weather_info.dart';
import 'package:analog_clock/components/dark_analog_clock.dart';
import 'package:analog_clock/components/light_analog_clock.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);

  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime _now = DateTime.now();
  String _temperature = '';
  String _temperatureRange = '';
  String _condition = '';
  String _location = '';
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    // Set the initial values.
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(AnalogClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      _temperature = widget.model.temperatureString;
      _temperatureRange = '(${widget.model.low} - ${widget.model.highString})';
      _condition = widget.model.weatherString;
      _location = widget.model.location;
    });
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      // Update once per second. Make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(milliseconds: 1) - Duration(microseconds: _now.microsecond),
        _updateTime,
      );
    });
  }

  ThemeData _getThemeInfo(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return Theme.of(context).brightness == Brightness.light
        ? Theme.of(context).copyWith(
            primaryColor: HexColor('FFFFFF'),
            highlightColor: HexColor('F2F5FC'),
            backgroundColor: HexColor('F9F9FA'),
            textTheme: TextTheme(
              body1: TextStyle(
                fontSize: 16.0,
                fontFamily: 'BreeSerif',
                color: Colors.black,
              ),
                body2: TextStyle(
                  fontSize: 20 * (_size.shortestSide / _size.longestSide),
                  fontFamily: 'BreeSerif',
                  color: Colors.black,
                )
            ),
          )
        : Theme.of(context).copyWith(
            primaryColor: HexColor('#142550'),
            highlightColor: HexColor('#22335e'),
            backgroundColor: HexColor('#142550'),
            textTheme: TextTheme(
              body1: TextStyle(
                fontSize: 14.0,
                fontFamily: 'BreeSerif',
                color: Colors.white,
              ),
              body2: TextStyle(
                fontSize: 20 * (_size.shortestSide / _size.longestSide),
                fontFamily: 'BreeSerif',
                color: Colors.white,
              )
            ),
          );
  }

  String _getTimeString() {
    String time = '';
    if (widget.model.is24HourFormat) {
      time = DateFormat.Hms().format(_now);
    } else {
      time = DateFormat('h:m:s').format(_now);
    }

    return time;
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = _getThemeInfo(context);
    final time = _getTimeString();

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Analog clock with time $time',
        value: time,
      ),
      child: Container(
        color: customTheme.backgroundColor,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              children: <Widget>[
                Expanded(
                    child: WeatherInfo(
                  theme: customTheme,
                  condition: _condition,
                  temperature: _temperature,
                  temperatureRange: _temperatureRange,
                  location: _location,
                )),
                Expanded(
                  flex: 3,
                  child: Theme.of(context).brightness == Brightness.light
                      ? LightAnalogClock(
                          model: widget.model,
                          time: time,
                          now: _now,
                          constraints: constraints,
                          customTheme: customTheme,
                        )
                      : DarkAnalogClock(
                          model: widget.model,
                          time: time,
                          now: _now,
                          constraints: constraints,
                          customTheme: customTheme,
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
