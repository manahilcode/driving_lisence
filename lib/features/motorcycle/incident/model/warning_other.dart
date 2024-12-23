class WarningIncidentModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String tip;
  final String title;

  WarningIncidentModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  // Factory method to create WarningIncidentModel from a JSON-like map
  factory WarningIncidentModel.fromMap(Map<String, dynamic> map) {
    return WarningIncidentModel(
      image: map['image'] as String,
      points: List<String>.from(map['points'] ?? []),
      subtitle: map['subtitle'] as String,
      tip: map['tip'] as String,
      title: map['title'] as String,
    );
  }

  // Convert WarningIncidentModel to a JSON-like map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'tip': tip,
      'title': title,
    };
  }
}
