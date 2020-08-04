import 'package:footballmanager/model/team.dart';
import 'package:footballmanager/model/match.dart';
import 'package:footballmanager/model/team_member.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Networking {
  String API_KEY = '15bb9209050144b0a7f0118238541917';
  String BASE_URL = 'https://api.football-data.org/v2/';

  Future<List<Team>> fetchTeams() async {
    String fullUrl = BASE_URL + 'teams/';
    List<Team> teams = List<Team>();

    var response = await http.get(
      fullUrl,
      headers: {'X-Auth-Token': API_KEY},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['count'];
      var teamsJson = jsonResponse['teams'];
      for (int i = 0; i < itemCount; i++) {
        var teamJson = teamsJson[i];
        var team = Team.fromJson(teamJson);
        teams.add(team);
      }
    } else {
      print('error code: ' + response.statusCode.toString());
    }
    return teams;
  }

  Future<List<Match>> upcomingMatchesForTeam(Team team) async {
    List<Match> matches = List<Match>();
    String fullUrl = BASE_URL +
        'teams/' +
        team.id.toString() +
        '/matches?limit=10&status=SCHEDULED';
    var response = await http.get(
      fullUrl,
      headers: {'X-Auth-Token': API_KEY},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['count'];
      var matchesJson = jsonResponse['matches'];
      for (int i = 0; i < itemCount; i++) {
        var matchJson = matchesJson[i];
        var match = Match.fromJson(matchJson);
        matches.add(match);
      }
    } else {
      print('error code: ' + response.statusCode.toString());
    }

    return matches;
  }

  Future<List<TeamMember>> playersForTeam(Team team) async {
    String fullUrl = BASE_URL + 'teams/' + team.id.toString();
    var response = await http.get(
      fullUrl,
      headers: {'X-Auth-Token': API_KEY},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var team = Team.fromJson(jsonResponse);
      return team.squad;
    } else {
      print('error code: ' + response.statusCode.toString());
      List<TeamMember> empty = List<TeamMember>();
      return empty;
    }
  }

//competitions
}
