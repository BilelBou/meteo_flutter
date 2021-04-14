import 'package:flutter/material.dart';

class DayHorizontalCard extends StatefulWidget {
  DayHorizontalCard({Key key, @required this.day, @required this.temperature, @required this.weather}) : super(key: key);

  final String day;
  final String temperature;
  final String weather;

  @override
  _DayHorizontalCardState createState() => _DayHorizontalCardState();
}

class _DayHorizontalCardState extends State<DayHorizontalCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: 5),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("images/" + widget.weather + ".png", width: 32, height: 32,),
              Text(
                widget.day,
                style: TextStyle(
                    color: Color(0xff464e76), fontSize: 15),
              ),
              Text(
                widget.temperature + "°",
                style: TextStyle(
                    color: Color(0xffadb7d5), fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}