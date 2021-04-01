import 'dart:convert';
import 'dart:io';

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
    return Future.delayed(Duration(seconds: 2), () => {'city': city, 'test': 'testData'});
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
              Color(0xffeef1ff,),
              Color(0xffcaddff),
              Color(0xffc3d0ff)
            ]
          )
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, User", style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
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
                            ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.cloud, color: Color(0xff8a9cfd)),
                                  SizedBox(width: 5,),
                                  Text("Cloudy", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),),
                                ],
                              ),

                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.stacked_line_chart, color: Color(0xff8a9cfd)),
                                  SizedBox(width: 5,),
                                  Text("20Km/h", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),),
                                ],
                              ),
                              SizedBox(height: 20),

                              Row(
                                children: [
                                  Icon(Icons.cloud, color: Color(0xff8a9cfd)),
                                  SizedBox(width: 5,),
                                  Text("50%", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("15°", style: TextStyle(
                                fontSize: 90,
                                color: Colors.white,
                              ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_upward_rounded, color: Color(0xffbfc8fa)),
                                      Text("17", style: TextStyle(
                                        color: Colors.white
                                      ),),
                                    ],
                                  ),
                                  SizedBox(width: 30,),
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_downward_rounded, color: Color(0xffbfc8fa)),
                                      Text("12", style: TextStyle(
                                        color: Colors.white
                                      ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30,)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    separatorBuilder: (_, index) => SizedBox(width: 10,),
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
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}