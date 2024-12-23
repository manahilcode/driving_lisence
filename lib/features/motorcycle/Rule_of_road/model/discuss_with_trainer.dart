class DiscussWithTrainerRule {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  DiscussWithTrainerRule({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // From JSON
  factory DiscussWithTrainerRule.fromMap(Map<String, dynamic> data) {
    return DiscussWithTrainerRule(
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'points1': points1,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
