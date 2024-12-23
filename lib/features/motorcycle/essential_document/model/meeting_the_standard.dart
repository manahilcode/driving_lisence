class MeetingTheStandardDocument {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  MeetingTheStandardDocument({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory MeetingTheStandardDocument.fromMap(Map<String, dynamic> map) {
    return MeetingTheStandardDocument(
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      title: map['title'] ?? '',
      title1: map['title1'] ?? '',
      title2: map['title2'] ?? '',
    );
  }
}
