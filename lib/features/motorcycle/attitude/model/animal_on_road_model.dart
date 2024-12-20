class AnimalsOnTheRoadModel {
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String title;

  AnimalsOnTheRoadModel({
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  factory AnimalsOnTheRoadModel.fromFirestore(Map<String, dynamic> data) {
    return AnimalsOnTheRoadModel(
      points: List<String>.from(data['points']),
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      title: data['title'] as String,
    );
  }
}
