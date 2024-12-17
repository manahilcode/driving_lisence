class HazardManagement {
  final String title;
  final String subtitle;
  final String tip;
  final List<String> points;

  HazardManagement({
    required this.title,
    required this.subtitle,
    required this.tip,
    required this.points,
  });

  // Convert to a map for easy JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'tip': tip,
      'points': points,
    };
  }

  // Convert from a map to the object (for deserialization)
  factory HazardManagement.fromMap(Map<String, dynamic> map) {
    return HazardManagement(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      tip: map['tip'] ?? '',
      points: List<String>.from(map['points'] ?? []),
    );
  }
}
