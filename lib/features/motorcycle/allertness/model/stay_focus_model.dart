class StayFocusModel {
  final String title;
  final String subtitle;
  final List<String> points;

  StayFocusModel({
    required this.title,
    required this.subtitle,
    required this.points,
  });

  factory StayFocusModel.fromFirestore(Map<String, dynamic> json) {
    return StayFocusModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      points: List<String>.from(json['points']),
    );
  }
}
