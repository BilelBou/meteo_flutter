import 'package:flutter/material.dart';
import 'package:meteo_flutter/components/hour_vertical_pill.dart';

class HourHorizontalPillList extends StatefulWidget {
  HourHorizontalPillList({Key key, @required this.hourlyWeather}) : super(key: key);

  final List<Map<String, Object>> hourlyWeather;

  @override
  _HourHorizontalPillListState createState() => _HourHorizontalPillListState();
}

class _HourHorizontalPillListState extends State<HourHorizontalPillList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            hour: widget.hourlyWeather[index]['time'],
            temperature: widget.hourlyWeather[index]['temperature'],
            weather: widget.hourlyWeather[index]['weather'],
          );
        },
      ),
    );
  }
}