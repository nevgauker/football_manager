class Match {
  Match({
    this.id,
    this.competition,
    this.status,
    this.homeTeam,
    this.awayTeam,
    this.utcDate,
  });

  final int id;
  final String competition;
  final String status;
  final String homeTeam;
  final String awayTeam;
  final String utcDate;

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      competition: json['competition']['name'],
      utcDate: json['utcDate'],
      homeTeam: json['homeTeam']['name'],
      awayTeam: json['awayTeam']['name'],
      status: json['status'],
    );
  }
}
