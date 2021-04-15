import 'package:flutter/material.dart';

class DayVerticalPill extends StatefulWidget {
  DayVerticalPill({Key key, @required this.day, @required this.temperature, @required this.weather, this.sizeRatio = 1}) : super(key: key);

  final String day;
  final String temperature;
  final String weather;
  final double sizeRatio;

  @override
  _DayVerticalPillState createState() => _DayVerticalPillState();
}

class _DayVerticalPillState extends State<DayVerticalPill> {
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
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.day,
                  style: TextStyle(
                    color: Color(0xffbac0d8), fontSize: 15 * widget.sizeRatio
                  ),
                ),
                Image.asset("images/" + widget.weather + ".png", width: 32 * widget.sizeRatio, height: 32 * widget.sizeRatio,),
                Text(
                  widget.temperature + "°",
                  style: TextStyle(
                      color: Color(0xff394168), fontSize: 20 * widget.sizeRatio),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}