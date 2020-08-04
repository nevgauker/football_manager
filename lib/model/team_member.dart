class TeamMember {
  TeamMember(
      {this.id,
      this.name,
      this.position,
      this.dateOfBirth,
      this.countryOfBirth,
      this.nationality,
      this.role});

  final int id;
  final String name;
  final String position;
  final String dateOfBirth;
  final String countryOfBirth;
  final String nationality;
  final String role;

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      dateOfBirth: json['dateOfBirth'],
      countryOfBirth: json['countryOfBirth'],
      nationality: json['nationality'],
      role: json['role'],
    );
  }
}
