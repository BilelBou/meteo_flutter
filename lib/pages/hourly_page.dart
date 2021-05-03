import 'package:meteo_flutter/components/hour_vertical_pill.dart';
import 'package:meteo_flutter/components/hour_vertical_pill_grid.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';
import 'package:meteo_flutter/util.dart';

class HourlyPage extends StatefulWidget {
  @override
  _HourlyPageState createState() => _HourlyPageState();
}

class _HourlyPageState extends State<HourlyPage> {
  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Hourly Weather",
      backAction: () => NavigationSystem.instance.pop(),
      children: [
        Expanded(
          child: HourVerticalPillGrid(
            hourlyWeather: generateHourlyWeather('Paris'),
          ),
        ),
      ],
    );
  }
}
