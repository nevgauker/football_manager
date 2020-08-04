import 'package:flutter/material.dart';

class MatchRow extends StatelessWidget {
  MatchRow({this.iconData, this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: 10.0,
          ),
          child: Icon(
            iconData,
            size: 25.0,
          ),
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
