class ThingsDiscussDocument {
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  ThingsDiscussDocument({
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory ThingsDiscussDocument.fromMap(Map<String, dynamic> map) {
    return ThingsDiscussDocument(
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      subtitle: map['subtitle'] ?? '',
      title: map['title'] ?? '',
      title1: map['title1'] ?? '',
      title2: map['title2'] ?? '',
    );
  }
}
