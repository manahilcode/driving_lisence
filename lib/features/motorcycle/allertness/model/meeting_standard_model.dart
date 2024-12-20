class MeetingTheStandardsModel {
  final List<String> points;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  MeetingTheStandardsModel({
    required this.points,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory MeetingTheStandardsModel.fromFirestore(Map<String, dynamic> data) {
    return MeetingTheStandardsModel(
      points: List<String>.from(data['points'] as List),
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
      title1: data['title1'] as String,
      title2: data['title2'] as String,
    );
  }
}
