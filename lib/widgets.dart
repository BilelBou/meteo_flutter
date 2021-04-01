import 'package:flutter/material.dart';

class CustomWidgets {

  // Global appbar for pages
  static Widget buildAppBar(BuildContext context, String appBarTitle, Function menuPressedAction, Function iconPressedAction) {
    return AppBar(
      title: Text(appBarTitle),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => menuPressedAction,
      ),
      actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () => iconPressedAction)],
    );
  }
}