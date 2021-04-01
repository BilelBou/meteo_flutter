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
      appBar: CustomWidgets.buildAppBar(context, 'Dashboard', null, null),
      body: Center(
        child: FutureBuilder(
          future: getWeatherForCity("Paris"),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator();
            else if (snapshot.hasError)
              return Text(snapshot.error.toString());

            var data = snapshot.data;
            print(data);

            return Text(data.toString());
          },
        ),
      ),
    );
  }
}