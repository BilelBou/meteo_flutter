import 'package:meteo_flutter/components/day_vertical_pill.dart';
import 'package:meteo_flutter/components/hour_vertical_pill.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  var dailyWeather = [
    {
      'day': 'Monday',
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'day': 'Thuesday',
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'day': 'Wednesday',
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'day': 'Thursday',
      'weather': 'rain',
      'temperature': '14'
    },
    {
      'day': 'Friday',
      'weather': 'rain',
      'temperature': '13'
    },
    {
      'day': 'Saturday',
      'weather': 'sun',
      'temperature': '13.5'
    },
    {
      'day': 'Sunday',
      'weather': 'sun',
      'temperature': '13.5'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Daily Weather",
      backAction: () => NavigationSystem.instance.pop(),
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: List.generate(7, (index) {
              return DayVerticalPill(
                sizeRatio: 1.5,
                day: dailyWeather[index]['day'],
                temperature: dailyWeather[index]['temperature'],
                weather: dailyWeather[index]['weather'],
              );
            }),
          ),
        ),
      ],
    );
  }
}
