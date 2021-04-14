import 'package:flutter/material.dart';

class NavigationSystem {
  NavigationSystem._privateConstructor();

  static final NavigationSystem _instance =
      NavigationSystem._privateConstructor();
  
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> getNavigatorKey() {
    return _navigatorKey;
  }

  Future navigateTo(String name, {Object arguments}) {
    return _navigatorKey.currentState.pushNamed(name, arguments: arguments);
  }

  Future navigateToAndRemove(String name, {Object arguments}) {
    return _navigatorKey.currentState.pushNamedAndRemoveUntil(name, (route) => true, arguments: arguments);
  }

  void pop() {
    return _navigatorKey.currentState.pop();
  }

  void popUntil(String name) {
    return _navigatorKey.currentState.popUntil(ModalRoute.withName(name));
  }

  static NavigationSystem get instance => _instance;
}
