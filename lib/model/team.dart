import 'team_member.dart';

class Team {
  Team({this.id, this.name, this.crestUrl, this.squad});

  final int id;
  final String name;
  final String crestUrl;
  List<TeamMember> squad = List<TeamMember>();

  factory Team.fromJson(Map<String, dynamic> json) {
    var squadJson = json['squad'];
    List<TeamMember> squadList = List<TeamMember>();
    if (squadJson != null) {
      for (var memberJson in squadJson) {
        TeamMember teamMember = TeamMember(
          id: memberJson['id'],
          name: memberJson['name'],
          dateOfBirth: memberJson['dateOfBirth'],
          countryOfBirth: memberJson['countryOfBirth'],
          nationality: memberJson['nationality'],
          role: memberJson['role'],
          position: memberJson['role'],
        );
        squadList.add(teamMember);
      }
    }

    Team team = Team(
      name: json['name'],
      id: json['id'],
      crestUrl: json['crestUrl'],
      squad: squadList,
    );

    return team;
  }
}
