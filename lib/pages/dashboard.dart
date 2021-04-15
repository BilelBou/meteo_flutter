import 'dart:convert';
import 'dart:io';

import 'package:meteo_flutter/components/day_vertical_card_list.dart';
import 'package:meteo_flutter/components/hour_horizontal_pill_list.dart';
import 'package:meteo_flutter/components/meteo_card.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/components/subtitle_action.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var headers = {
    HttpHeaders.contentTypeHeader: 'application/x-www_form-urlencoded',
  };
  var url = Uri.http('10.0.2.2:8080', 'api/user/');

  Future<dynamic> getWeatherForCity(String city) {
    return Future.delayed(
        Duration(seconds: 2), () => {'city': city, 'test': 'testData'});
  }

  var hourlyWeather = [
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

  var dailyWeather = [
    {
      'day': 'Today',
      'weather': 'sun',
      'temperature': '15'
    },
    {
      'day': 'Tomorrow',
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
  ];

  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Hello, User",
      children: [
        MeteoCard(
          weather: "Cloudy",
          windSpeed: 20,
          humidity: 50,
          temperature: 15,
        ),
        SizedBox(
          height: 30,
        ),
        SubtitleAction(
          title: "Next 5 hours",
          action: () {
            // Open some other page when clicking icon
            NavigationSystem.instance.navigateTo('/hourly');
          },
        ),
        SizedBox(height: 5,),
        HourHorizontalPillList(
          hourlyWeather: hourlyWeather,
        ),
        SizedBox(
          height: 30,
        ),
        SubtitleAction(
          title: "Next 5 days",
          action: () {
            // Open some other page when clicking icon
            NavigationSystem.instance.navigateTo('/daily');
          },
        ),
        SizedBox(height: 5,),
        DayVerticalCardList(
          dailyWeather: dailyWeather,
        ),
      ],
    );
  }
}
