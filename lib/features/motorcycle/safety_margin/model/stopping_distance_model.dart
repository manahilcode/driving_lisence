class StoppingDistanceModel {
  String image;
  List<String> points;
  String reflection;
  String subtitle;
  String subtitle1;
  String tip;
  String title;

  StoppingDistanceModel({
    required this.image,
    required this.points,
    required this.reflection,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  // Convert Firestore data to model
  factory StoppingDistanceModel.fromJson(Map<String, dynamic> json) {
    return StoppingDistanceModel(
      image: json['image'] ?? '',
      points: List<String>.from(json['points'] ?? []),
      reflection: json['reflection'] ?? '',
      subtitle: json['subtitle'] ?? '',
      subtitle1: json['subtitle1'] ?? '',
      tip: json['tip'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
