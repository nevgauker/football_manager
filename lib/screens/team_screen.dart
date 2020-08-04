import 'package:flutter/material.dart';
import 'package:footballmanager/model/team.dart';
import 'package:footballmanager/model/match.dart';
import 'package:footballmanager/model/team_member.dart';
import 'package:footballmanager/services/networking.dart';
import 'package:footballmanager/widgets/upcoming_matches_list.dart';
import 'package:footballmanager/widgets/team_info.dart';
import 'package:footballmanager/widgets/players_list.dart';

class TeamScreen extends StatefulWidget {
  static final screen_id = 'team_screen';

  TeamScreen({this.team});

  final Team team;

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  Networking networking = Networking();
  Future<List<Match>> matches;
  Future<List<TeamMember>> players;

  @override
  void initState() {
    super.initState();
    matches = networking.upcomingMatchesForTeam(widget.team);
    players = networking.playersForTeam(widget.team);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Team Screen'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Team Info',
              ),
              Tab(
                text: 'Players',
              ),
              Tab(
                text: 'Upcoming Matches',
              ),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: <Widget>[
              TeamInfo(
                team: widget.team,
              ),
              FutureBuilder<List<TeamMember>>(
                future: players,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: PlayersList(players: snapshot.data),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              FutureBuilder<List<Match>>(
                future: matches,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: UpcomingMatchesList(
                        matches: snapshot.data,
                        teamName: widget.team.name,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
