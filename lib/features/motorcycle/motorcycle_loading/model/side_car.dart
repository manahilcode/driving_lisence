class PillionPassengerModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;
  final String title1;

  PillionPassengerModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
    required this.title1,
  });

  // Factory method to create PillionPassengerModel from a map
  factory PillionPassengerModel.fromMap(Map<String, dynamic> map) {
    return PillionPassengerModel(
      image: map['image'] as String,
      points: List<String>.from(map['points'] ?? []),
      subtitle: map['subtitle'] as String,
      title: map['title'] as String,
      title1: map['title1'] as String,
    );
  }

  // Convert PillionPassengerModel to a map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
    };
  }
}
