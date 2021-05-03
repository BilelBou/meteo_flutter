import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';
import 'package:meteo_flutter/routeGenerator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// Home page is displaying the bottom navigation bar and the selected item
// which is a page widget that is nested inside of it
class _HomePageState extends State<HomePage> {
  // Stores the selected index of the navigation bar
  int _navBarSelectedIndex = 0;

  // Handle navigation bar tapping to change page
  void _onNavBarItemTap(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        NavigationSystem.instance.navigateTo('/dashboard');
        break;
      case 1:
        NavigationSystem.instance.navigateTo('/towns');
        break;
      case 2:
        NavigationSystem.instance.navigateTo('/profile');
        break;
      case 3:
        NavigationSystem.instance.navigateTo('/settings');
        break;
    }
  }

  // Widgets for bottom navigation bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: NavigationSystem.instance.getNavigatorKey(),
        initialRoute: '/dashboard',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(color: Color(0xff071343), size: 25),
        selectedIconTheme: IconThemeData(color: Color(0xff2b4efe), size: 26),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onNavBarItemTap,
        // List of items/icons in the bottom navigation bar, these will be linked to pages
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_sunny,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_city,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.portrait,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: '',
          ),
        ],
        currentIndex: _navBarSelectedIndex,
      ),
    );
  }
}