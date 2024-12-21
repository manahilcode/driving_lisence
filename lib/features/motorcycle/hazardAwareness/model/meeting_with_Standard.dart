class HazardAwarenessMeetingStandard {
  final String id; // Document ID
  final String title; // Main title
  final String title2; // Secondary title
  final String title3; // Tertiary title
  final List<String> points; // List of points under "You must be able to"
  final List<String> points1; // List of points under "You must know and understand"

  HazardAwarenessMeetingStandard({
    required this.id,
    required this.title,
    required this.title2,
    required this.title3,
    required this.points,
    required this.points1,
  });

  // Factory method to create a model from Firestore data
  factory HazardAwarenessMeetingStandard.fromFirestore(String id, Map<String, dynamic> data) {
    return HazardAwarenessMeetingStandard(
      id: id,
      title: data['title'] ?? '',
      title2: data['title2'] ?? '',
      title3: data['title3'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
    );
  }
}
