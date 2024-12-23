// Model class
class MeetingStandardsRule {
  final List<String> points;
  final List<String> points1;
  final String subtitle2;
  final String title;
  final String title1;

  MeetingStandardsRule({
    required this.points,
    required this.points1,
    required this.subtitle2,
    required this.title,
    required this.title1,
  });

  factory MeetingStandardsRule.fromMap(Map<String, dynamic> map) {
    return MeetingStandardsRule(
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      subtitle2: map['subtitle2'] ?? '',
      title: map['title'] ?? '',
      title1: map['title1'] ?? '',
    );
  }
}