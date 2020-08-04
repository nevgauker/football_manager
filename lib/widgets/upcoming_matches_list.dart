import 'package:flutter/material.dart';
import 'package:footballmanager/model/match.dart';
import 'package:footballmanager/widgets/match_row.dart';

class UpcomingMatchesList extends StatelessWidget {
  UpcomingMatchesList({this.matches, this.teamName});

  final List<Match> matches;
  final String teamName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          Match match = matches[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MatchRow(
                    text: teamName == match.homeTeam
                        ? match.awayTeam
                        : match.homeTeam,
                    iconData: Icons.people_outline,
                  ),
                  MatchRow(
                    text: match.competition,
                    iconData: Icons.group,
                  ),
                  MatchRow(
                    text: match.utcDate,
                    iconData: Icons.update,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
