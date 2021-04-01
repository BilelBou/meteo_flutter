import 'package:meteo_flutter/pages/dashboard.dart';
import 'package:meteo_flutter/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// Home page is displaying the bottom navigation bar and the selected item
// which is a page widget that is nested inside of it
class _HomePageState extends State<HomePage> {
  // Create page controller method
  PageController _pageController = PageController(
    initialPage: 0,
  );

  // List of Widgets for the screens/pages
  List<Widget> _listPages = [Dashboard(), Settings()];

  // Stores the selected index of the navigation bar
  int _navBarSelectedIndex = 0;

  // Called when page changes from the navigation bar
  void _onPageChanged(int index) {
    setState(() {
      _navBarSelectedIndex = index;
    });
  }

  // Handle navigation bar tapping to change page
  void _onNavBarItemTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  // Widgets for bottom navigation bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _listPages,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(color: Color.fromARGB(220, 220, 220, 220), size: 25),
        selectedIconTheme: IconThemeData(color: Colors.white, size: 26),

        onTap: _onNavBarItemTap,
        // List of items/icons in the bottom navigation bar, these will be linked to pages
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_sunny
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _navBarSelectedIndex,
      ),
    );
  }
}