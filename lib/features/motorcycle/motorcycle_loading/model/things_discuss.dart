class TrainerDiscussionModelLoading {
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String title;
  final String title1;

  TrainerDiscussionModelLoading({
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.title,
    required this.title1,
  });

  // Factory method to create TrainerDiscussionModel from a map
  factory TrainerDiscussionModelLoading.fromMap(Map<String, dynamic> map) {
    return TrainerDiscussionModelLoading(
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      subtitle: map['subtitle'] as String,
      title: map['title'] as String,
      title1: map['title1'] as String,
    );
  }

  // Convert TrainerDiscussionModel to a map
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'points1': points1,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
    };
  }
}
