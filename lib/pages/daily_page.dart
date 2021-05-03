import 'package:meteo_flutter/components/day_vertical_pill_grid.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';
import 'package:meteo_flutter/util.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Daily Weather",
      backAction: () => NavigationSystem.instance.pop(),
      children: [
        Expanded(
          child: DayVerticalPillGrid(
            dailyWeather: generateDailyWeather('Paris'),
          ),
        ),
      ],
    );
  }
}
