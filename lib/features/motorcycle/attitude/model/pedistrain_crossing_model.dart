class CrossingModel {
  final List<String> defination;
  final List<String> points;
  final List<String> points1;
  final List<String> points2;
  final List<String> points3;
  final String subtitle;
  final String title;

  CrossingModel({
    required this.defination,
    required this.points,
    required this.points1,
    required this.points2,
    required this.points3,
    required this.subtitle,
    required this.title,
  });

  factory CrossingModel.fromFirestore(Map<String, dynamic> data) {
    return CrossingModel(
      defination: List<String>.from(data['defination'] ?? []),
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      points2: List<String>.from(data['points2'] ?? []),
      points3: List<String>.from(data['points3'] ?? []),
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
    );
  }
}
