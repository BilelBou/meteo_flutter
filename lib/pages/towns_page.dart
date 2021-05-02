import 'package:meteo_flutter/components/day_vertical_pill_grid.dart';
import 'package:meteo_flutter/components/hour_vertical_pill_grid.dart';
import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:flutter/material.dart';
import 'package:meteo_flutter/util.dart';

class TownsPage extends StatefulWidget {
  @override
  _TownsPageState createState() => _TownsPageState();
}

class _TownsPageState extends State<TownsPage> {
  String dropdownValue = 'Paris';

  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Town Weather",
      tabBar: true,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose a city", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    if (newValue != null)
                      dropdownValue = newValue;
                  });
                },
                items: cities
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TabBar(
          tabs: [
            Tab(
              child: Text(
                "Hourly Weather",
                style: TextStyle(
                  color: Colors.grey[900]
                ),
              )
            ),
            Tab(
              child: Text(
                "Daily Weather",
                style: TextStyle(
                  color: Colors.grey[900]
                ),
              )
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: TabBarView(
            children: [
              HourVerticalPillGrid(
                hourlyWeather: generateHourlyWeather(dropdownValue),
              ),
              DayVerticalPillGrid(
                dailyWeather: generateDailyWeather(dropdownValue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
