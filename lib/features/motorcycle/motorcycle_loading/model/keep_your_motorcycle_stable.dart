class MotorcycleStabilityModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final List<String> tip;
  final String title;

  MotorcycleStabilityModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  // Factory method to create MotorcycleStabilityModel from a JSON-like map
  factory MotorcycleStabilityModel.fromMap(Map<String, dynamic> map) {
    return MotorcycleStabilityModel(
      image: map['image'] as String,
      points: List<String>.from(map['points'] ?? []),
      subtitle: map['subtitle'] as String,
      tip: List<String>.from(map['tip'] ?? []),
      title: map['title'] as String,
    );
  }

  // Convert MotorcycleStabilityModel to a JSON-like map
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
