import 'package:flutter/material.dart';
import 'package:footballmanager/model/team_member.dart';

class TeamMemberRow extends StatelessWidget {
  TeamMemberRow({this.player});

  final TeamMember player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(player.name),
        Text(player.position),
      ],
    );
  }
}
