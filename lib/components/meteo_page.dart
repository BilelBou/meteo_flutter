import 'package:flutter/material.dart';

class MeteoPage extends StatefulWidget {
  MeteoPage({Key key, @required this.title, @required this.children, this.backAction}) : super(key: key);

  final String title;
  final List<Widget> children;
  final VoidCallback backAction;

  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  @override
  Widget build(BuildContext context) {
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