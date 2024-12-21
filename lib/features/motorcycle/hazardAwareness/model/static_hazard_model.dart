class StaticHazard {
  final String title;          // Main title
  final String subtitle;       // Subtitle about static hazards
  final String tip;            // Tip related to level crossings
  final List<String> points;   // List of static hazards

  StaticHazard({
    required this.title,
    required this.subtitle,
    required this.tip,
    required this.points,
  });

  // Factory method to create a model from Firestore data
  factory StaticHazard.fromFirestore(Map<String, dynamic> data) {
    return StaticHazard(
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      tip: data['tip'] ?? '',
      points: List<String>.from(data['points'] ?? []),
    );
  }
}
