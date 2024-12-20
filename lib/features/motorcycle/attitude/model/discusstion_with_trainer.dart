class TrainerDiscussionModel {
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  TrainerDiscussionModel({
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory TrainerDiscussionModel.fromFirestore(Map<String, dynamic> data) {
    return TrainerDiscussionModel(
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
      title1: data['title1'] as String,
      title2: data['title2'] as String,
    );
  }
}
