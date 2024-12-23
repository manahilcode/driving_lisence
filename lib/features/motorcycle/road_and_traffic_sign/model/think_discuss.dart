// TrainerPractise Model
class TrainerPractise {
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  TrainerPractise({
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory TrainerPractise.fromJson(Map<String, dynamic> json) {
    return TrainerPractise(
      points: List<String>.from(json['points'] ?? []),
      points1: List<String>.from(json['points1'] ?? []),
      subtitle: json['subtitle'] ?? '',
      title: json['title'] ?? '',
      title1: json['title1'] ?? '',
      title2: json['title2'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'points1': points1,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}