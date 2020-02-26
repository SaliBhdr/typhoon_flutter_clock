import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class WeatherInfo extends StatelessWidget {
  final ThemeData theme;
  final String temperature;
  final String temperatureRange;

  final String condition;
  final String location;

  WeatherInfo({
    @required this.theme,
    @required this.condition,
    @required this.temperature,
    @required this.temperatureRange,
    @required this.location,
  })  : assert(theme != null),
        assert(condition != null),
        assert(temperature != null),
        assert(temperatureRange != null),
        assert(location != null);

  Widget _getConditionIcon({size: 60}) {
    IconData _icon;

    switch (condition) {
      case 'sunny':
        _icon = WeatherIcons.wiDaySunny;
        break;
      case 'foggy':
        _icon = WeatherIcons.wiFog;
        break;
      case 'rainy':
        _icon = WeatherIcons.wiRain;
        break;
      case 'snowy':
        _icon = WeatherIcons.wiSnow;
        break;
      case 'thunderstorm':
        _icon = WeatherIcons.wiThunderstorm;
        break;
      case 'windy':
        _icon = WeatherIcons.wiWindy;
        break;
      case 'cloudy':
        _icon = WeatherIcons.wiCloudy;
        break;
    }

    return IconButton(
      iconSize: size,
      icon: Icon(_icon),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    final double _sizeRatio = _size.shortestSide / _size.longestSide;

    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: DefaultTextStyle(
        style: theme.textTheme.body2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  _getConditionIcon(
                    size: 70 * _sizeRatio,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    temperature,
                    style: TextStyle(
                      fontSize: 40 * _sizeRatio,
                    ),
                  ),
                  Text(
                    temperatureRange,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 25 * _sizeRatio,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
