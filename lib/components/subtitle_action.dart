import 'package:flutter/material.dart';

class SubtitleAction extends StatefulWidget {
  SubtitleAction({Key key, @required this.title, this.action}) : super(key: key);

  final String title;
  final VoidCallback action;

  @override
  _SubtitleActionState createState() => _SubtitleActionState();
}

class _SubtitleActionState extends State<SubtitleAction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff3b426a)
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_right_alt_rounded, color: Color(0xff3b426a),),
          onPressed: widget.action,
        ),
      ],
    );
  }
}