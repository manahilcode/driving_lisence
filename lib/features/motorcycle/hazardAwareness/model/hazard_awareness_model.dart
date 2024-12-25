class MotorcycleHazardAwareness {
  final String title; // Title field
  final String imageUrl; // Image URL field
  final List<String> points; // Array of points

  MotorcycleHazardAwareness({
    required this.title,
    required this.imageUrl,
    required this.points,
  });

  // Factory method to create a model from Firestore data
  factory MotorcycleHazardAwareness.fromFirestore(Map<String, dynamic> data) {
    return MotorcycleHazardAwareness(
      title: data['title'] ?? '',
      imageUrl: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
    );
  }
}
