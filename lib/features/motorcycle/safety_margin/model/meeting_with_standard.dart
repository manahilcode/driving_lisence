class MeetingTheStandards_Safety_Margin {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  MeetingTheStandards_Safety_Margin({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory MeetingTheStandards_Safety_Margin.fromJson(Map<String, dynamic> json) {
    return MeetingTheStandards_Safety_Margin(
      points: List<String>.from(json['points']),
      points1: List<String>.from(json['points1']),
      title: json['title'],
      title1: json['title1'],
      title2: json['title2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'points1': points1,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
