import 'package:meteo_flutter/components/day_vertical_card_list.dart';
import 'package:meteo_flutter/components/hour_horizontal_pill_list.dart';
import 'package:meteo_flutter/components/meteo_card.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/components/subtitle_action.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';
import 'package:meteo_flutter/util.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            NavigationSystem.instance.navigateTo('/hourly');
          },
        ),
        SizedBox(height: 5,),
        HourHorizontalPillList(
          hourlyWeather: generateHourlyWeather('Paris').skip(10).toList(),
        ),
        SizedBox(
          height: 30,
        ),
        SubtitleAction(
          title: "Next 5 days",
          action: () {
            NavigationSystem.instance.navigateTo('/daily');
          },
        ),
        SizedBox(height: 5,),
        DayVerticalCardList(
          dailyWeather: generateFiveDaysWeather('Paris'),
        ),
      ],
    );
  }
}
