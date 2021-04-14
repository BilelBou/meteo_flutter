import 'package:flutter/material.dart';
import 'package:meteo_flutter/components/day_horizontal_card.dart';

class DayVerticalCardList extends StatefulWidget {
  DayVerticalCardList({Key key, @required this.dailyWeather}) : super(key: key);

  final List<Map<String, Object>> dailyWeather;

  @override
  _DayVerticalCardListState createState() => _DayVerticalCardListState();
}

class _DayVerticalCardListState extends State<DayVerticalCardList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, index) => Divider(height: 1,),
        itemCount: 5,
        itemBuilder: (_, index) {
          return DayHorizontalCard(
            day: widget.dailyWeather[index]['day'],
            temperature: widget.dailyWeather[index]['temperature'],
            weather: widget.dailyWeather[index]['weather'],
          );
        },
      ),
    );
  }
}