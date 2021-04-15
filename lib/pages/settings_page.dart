import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Settings",
      children: [
        Text("Settings Page"),
      ],
    );
  }
}