class ThingsToDiscussModel {
  final List<String> points;
  final String title;

  ThingsToDiscussModel({
    required this.points,
    required this.title,
  });

  factory ThingsToDiscussModel.fromFirestore(Map<String, dynamic> data) {
    return ThingsToDiscussModel(
      points: List<String>.from(data['points'] as List),
      title: data['title'] as String,
    );
  }
}
