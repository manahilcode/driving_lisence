class MotorcycleHazardAwareness {
  final String id; // Document ID
  final String title; // Title field
  final String imageUrl; // Image URL field
  final List<String> points; // Array of points

  MotorcycleHazardAwareness({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.points,
  });

  // Factory method to create a model from Firestore data
  factory MotorcycleHazardAwareness.fromFirestore(String id, Map<String, dynamic> data) {
    return MotorcycleHazardAwareness(
      id: id,
      title: data['title'] ?? '',
      imageUrl: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
    );
  }
}
