import 'package:flutter/material.dart';

class HourVerticalPill extends StatefulWidget {
  HourVerticalPill({Key key, @required this.hour, @required this.temperature, @required this.weather, this.sizeRatio = 1}) : super(key: key);

  final int hour;
  final String temperature;
  final String weather;
  final double sizeRatio;

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
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.hour.toString() + "h",
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