import 'package:flutter/material.dart';
import 'package:meteo_flutter/components/hour_vertical_pill.dart';

class HourVerticalPillGrid extends StatefulWidget {
  HourVerticalPillGrid({Key key, @required this.hourlyWeather}) : super(key: key);

  final List<Map<String, Object>> hourlyWeather;

  @override
  _HourVerticalPillGridState createState() => _HourVerticalPillGridState();
}

class _HourVerticalPillGridState extends State<HourVerticalPillGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: List.generate(24, (index) {
        return HourVerticalPill(
          sizeRatio: 1.5,
          hour: widget.hourlyWeather[index]['time'],
          temperature: widget.hourlyWeather[index]['temperature'],
          weather: widget.hourlyWeather[index]['weather'],
        );
      }),
    );
  }
}