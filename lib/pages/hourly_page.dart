import 'package:meteo_flutter/components/hour_vertical_pill.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';

class HourlyPage extends StatefulWidget {
  @override
  _HourlyPageState createState() => _HourlyPageState();
}

class _HourlyPageState extends State<HourlyPage> {
  var hourlyWeather = [
    {
      'time': 0,
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'time': 1,
      'weather': 'rain',
      'temperature': '14'
    },
    {
      'time': 2,
      'weather': 'rain',
      'temperature': '13'
    },
    {
      'time': 3,
      'weather': 'sun',
      'temperature': '13.5'
    },
    {
      'time': 4,
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'time': 5,
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'time': 6,
      'weather': 'rain',
      'temperature': '14'
    },
    {
      'time': 7,
      'weather': 'rain',
      'temperature': '13'
    },
    {
      'time': 8,
      'weather': 'sun',
      'temperature': '13.5'
    },
    {
      'time': 9,
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'time': 10,
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'time': 11,
      'weather': 'rain',
      'temperature': '14'
    },
    {
      'time': 12,
      'weather': 'rain',
      'temperature': '13'
    },
    {
      'time': 13,
      'weather': 'sun',
      'temperature': '13.5'
    },
    {
      'time': 14,
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'time': 15,
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'time': 16,
      'weather': 'rain',
      'temperature': '14'
    },
    {
      'time': 17,
      'weather': 'rain',
      'temperature': '13'
    },
    {
      'time': 18,
      'weather': 'sun',
      'temperature': '13.5'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Hourly Weather",
      backAction: () => NavigationSystem.instance.pop(),
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: List.generate(19, (index) {
              return HourVerticalPill(
                sizeRatio: 1.5,
                hour: hourlyWeather[index]['time'],
                temperature: hourlyWeather[index]['temperature'],
                weather: hourlyWeather[index]['weather'],
              );
            }),
          ),
        ),
      ],
    );
  }
}
