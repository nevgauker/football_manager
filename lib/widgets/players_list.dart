import 'package:flutter/material.dart';
import 'package:footballmanager/model/team_member.dart';
import 'team_member_row.dart';

class PlayersList extends StatelessWidget {
  PlayersList({this.players});

  final List<TeamMember> players;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TeamMemberRow(player: players[index]),
          ),
        );
      },
    );
  }
}
