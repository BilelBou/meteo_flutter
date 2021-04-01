import 'package:meteo_flutter/pages/dashboard.dart';
import 'package:meteo_flutter/pages/home_page.dart';
import 'package:meteo_flutter/pages/settings_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case '/dashboard':
        return MaterialPageRoute(
          builder: (_) => Dashboard(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => Settings(),
        );
      default:
        // If there is no such named route in switch statement, display error
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR: Wrong page route/parameter(s)'),
        ),
      );
    });
  }
}