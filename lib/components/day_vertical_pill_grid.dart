import 'package:flutter/material.dart';
import 'package:meteo_flutter/components/day_vertical_pill.dart';

class DayVerticalPillGrid extends StatefulWidget {
  DayVerticalPillGrid({Key key, @required this.dailyWeather}) : super(key: key);

  final List<Map<String, Object>> dailyWeather;

  @override
  _DayVerticalPillGridState createState() => _DayVerticalPillGridState();
}

class _DayVerticalPillGridState extends State<DayVerticalPillGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: List.generate(7, (index) {
        return DayVerticalPill(
          sizeRatio: 1.5,
          day: widget.dailyWeather[index]['day'],
          temperature: widget.dailyWeather[index]['temperature'],
          weather: widget.dailyWeather[index]['weather'],
        );
      }),
    );
  }
}