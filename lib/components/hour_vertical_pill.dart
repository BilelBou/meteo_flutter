import 'package:flutter/material.dart';

class HourVerticalPill extends StatefulWidget {
  HourVerticalPill({Key key, @required this.hour, @required this.temperature, @required this.weather}) : super(key: key);

  final int hour;
  final String temperature;
  final String weather;

  @override
  _HourVerticalPillState createState() => _HourVerticalPillState();
}

class _HourVerticalPillState extends State<HourVerticalPill> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Container(
        height: 150,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
        ),
        padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: 5),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.hour.toString() + "h",
              style: TextStyle(
                  color: Color(0xffbac0d8), fontSize: 15),
            ),
            Image.asset("images/" + widget.weather + ".png", width: 32, height: 32,),
            Text(
              widget.temperature + "°",
              style: TextStyle(
                  color: Color(0xff394168), fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}