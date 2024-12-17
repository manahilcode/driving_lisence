class ReviewingYourDriving {
  final String title;
  final String subtitle;
  final List<String> points;

  ReviewingYourDriving({
    required this.title,
    required this.subtitle,
    required this.points,
  });

  // Convert to a map for easy JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'points': points,
    };
  }

  // Convert from a map to the object (for deserialization)
  factory ReviewingYourDriving.fromMap(Map<String, dynamic> map) {
    return ReviewingYourDriving(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      points: List<String>.from(map['points'] ?? []),
    );
  }
}
