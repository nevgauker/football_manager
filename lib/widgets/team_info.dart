import 'package:flutter/material.dart';
import 'package:footballmanager/model/team.dart';

class TeamInfo extends StatelessWidget {
  TeamInfo({this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: FadeInImage.assetNetwork(
              height: 100.0,
              placeholder: 'images/placeholder.png',
              image: team.crestUrl ?? ''),
        ),
        Center(
          child: Text(team.name),
        ),
      ],
    );
  }
}
