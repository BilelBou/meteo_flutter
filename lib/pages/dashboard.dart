import 'dart:convert';
import 'dart:io';

import 'package:meteo_flutter/components/MeteoCard.dart';
import 'package:meteo_flutter/main.dart';
import 'package:meteo_flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var headers = {
    HttpHeaders.contentTypeHeader: 'application/x-www_form-urlencoded',
  };
  var url = Uri.http('10.0.2.2:8080', 'api/user/');

  Future<dynamic> getWeatherForCity(String city) {
    return Future.delayed(
        Duration(seconds: 2), () => {'city': city, 'test': 'testData'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(
                  0xffeef1ff,
                ),
                Color(0xffcaddff),
                Color(0xffc3d0ff)
              ])),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, User",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  MeteoCard(
                    weather: "Cloudy",
                    windSpeed: 20,
                    humidity: 50,
                    temperature: 15,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      separatorBuilder: (_, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          child: Container(
                            height: 150,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "14h",
                                    style: TextStyle(
                                        color: Color(0xffbac0d8), fontSize: 15),
                                  ),
                                  Image.asset("images/sun.png"),
                                  Text(
                                    "15°",
                                    style: TextStyle(
                                        color: Color(0xff394168), fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Next 5 days", style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3b426a)
                      ),
                      ),
                      Icon(Icons.arrow_right_alt_rounded, color: Color(0xff3b426a),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (_, index) => Divider(height: 1,),
                      itemCount: 5,
                      itemBuilder: (_, index) {
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
                                  Image.asset("images/sun.png"),
                                  Text(
                                    "Tomorrow",
                                    style: TextStyle(
                                        color: Color(0xff464e76), fontSize: 15),
                                  ),
                                  Text(
                                    "15°",
                                    style: TextStyle(
                                        color: Color(0xffadb7d5), fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
