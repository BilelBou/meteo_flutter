import 'dart:ffi';

import 'package:flutter/material.dart';

class MeteoCard extends StatefulWidget {
  MeteoCard({Key key, this.weather, this.windSpeed, this.humidity, this.temperature}) : super(key: key);

  final String weather;
  final double windSpeed;
  final double humidity;
  final double temperature;

  @override
  _MeteoCardState createState() => _MeteoCardState();
}

class _MeteoCardState extends State<MeteoCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(0xff7c8df5).withOpacity(0.6),
              Color(0xff6b82f7),
              Color(0xff4f66dc)
            ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 40, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.cloud, color: Color(0xff8a9cfd)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.weather,
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.stacked_line_chart,
                            color: Color(0xff8a9cfd)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.windSpeed.toString() + "Km/h",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.cloud, color: Color(0xff8a9cfd)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.humidity.toString() + "%",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.temperature.toString() + "°",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_upward_rounded,
                                color: Color(0xffbfc8fa)),
                            Text(
                              "17",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_downward_rounded,
                                color: Color(0xffbfc8fa)),
                            Text(
                              "12",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}