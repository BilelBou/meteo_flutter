import 'dart:convert';
import 'dart:io';

import 'package:meteo_flutter/components/day_horizontal_card.dart';
import 'package:meteo_flutter/components/meteo_card.dart';
import 'package:meteo_flutter/components/hour_vertical_pill.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/components/subtitle_action.dart';
import 'package:meteo_flutter/main.dart';
import 'package:meteo_flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

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
          height: 50,
        ),
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            separatorBuilder: (_, index) => SizedBox(
              width: 10,
            ),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return HourVerticalPill(
                hour: hourlyWeather[index]['time'],
                temperature: hourlyWeather[index]['temperature'],
                weather: hourlyWeather[index]['weather'],
              );
            },
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SubtitleAction(
          title: "Next 5 days",
          action: () {
            // Open other page
            print("next 5 days page");
          },
        ),
        SizedBox(height: 5,),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, index) => Divider(height: 1,),
            itemCount: 5,
            itemBuilder: (_, index) {
              return DayHorizontalCard(
                day: dailyWeather[index]['day'],
                temperature: dailyWeather[index]['temperature'],
                weather: dailyWeather[index]['weather'],
              );
            },
          ),
        ),
      ],
    );
  }
}
