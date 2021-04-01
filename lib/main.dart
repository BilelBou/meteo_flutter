import 'package:meteo_flutter/pages/home_page.dart';
import 'package:meteo_flutter/routeGenerator.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline5: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          subtitle2: TextStyle(color: Colors.black),
        ),
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}