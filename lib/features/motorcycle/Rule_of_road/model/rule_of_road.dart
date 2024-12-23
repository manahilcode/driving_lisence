// Model Class
class RulesOfTheRoadModel {
  final String image;
  final List<String> points;
  final String title;

  RulesOfTheRoadModel({
    required this.image,
    required this.points,
    required this.title,
  });

  factory RulesOfTheRoadModel.fromMap(Map<String, dynamic> map) {
    return RulesOfTheRoadModel(
      image: map['image'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      title: map['title'] ?? '',
    );
  }
}