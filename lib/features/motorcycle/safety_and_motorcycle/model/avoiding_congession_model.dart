class AvoidingCongestionModel {
  final String image;
  final List<String> points;
  final List<String> points1;
  final List<String> points2;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String tip1;
  final String title;

  AvoidingCongestionModel({
    required this.image,
    required this.points,
    required this.points1,
    required this.points2,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.tip1,
    required this.title,
  });

  factory AvoidingCongestionModel.fromFirestore(Map<String, dynamic> data) {
    return AvoidingCongestionModel(
      image: data['image'] as String,
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      points2: List<String>.from(data['points2'] ?? []),
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      tip: data['tip'] as String,
      tip1: data['tip1'] as String,
      title: data['title'] as String,
    );
  }
}
