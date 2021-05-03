import 'package:flutter/material.dart';

class MeteoPage extends StatefulWidget {
  MeteoPage({Key key, @required this.title, @required this.children, this.backAction, this.tabBar}) : super(key: key);

  final String title;
  final List<Widget> children;
  final VoidCallback backAction;
  bool tabBar;

  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  @override
  void initState() { 
    super.initState();
    if (widget.tabBar == null) {
      widget.tabBar = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabBar != null && widget.tabBar == true)
      return _buildAppBarScaffold();
    return _buildNormalScaffold();
  }

  Widget _buildAppBarScaffold() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffeef1ff),
                Color(0xffcaddff),
                Color(0xffc3d0ff)
              ],
            )
          ),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (widget.backAction != null)
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: widget.backAction,
                        ),
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  for (var widget in widget.children)
                    widget
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNormalScaffold() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffeef1ff),
              Color(0xffcaddff),
              Color(0xffc3d0ff)
            ],
          )
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (widget.backAction != null)
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: widget.backAction,
                      ),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                for (var widget in widget.children)
                  widget
              ],
            ),
          ),
        ),
      ),
    );
  }
}