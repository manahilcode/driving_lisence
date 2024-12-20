class ThinkAboutModel {
  final List<String> points;
  final String title;

  ThinkAboutModel({
    required this.points,
    required this.title,
  });

  factory ThinkAboutModel.fromFirestore(Map<String, dynamic> data) {
    return ThinkAboutModel(
      points: List<String>.from(data['points'] as List),
      title: data['title'] as String,
    );
  }
}
