import 'package:meteo_flutter/widgets.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: CustomWidgets.buildAppBar(context, 'Settings', null, null),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}