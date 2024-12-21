class MotorwaysAndDualCarriageways {
  final String id; // Document ID
  final String title; // Main title
  final String title1; // Secondary title
  final String image; // Image URL
  final String subtitle; // First subtitle text
  final String subtitle1; // Second subtitle text

  MotorwaysAndDualCarriageways({
    required this.id,
    required this.title,
    required this.title1,
    required this.image,
    required this.subtitle,
    required this.subtitle1,
  });

  // Factory method to create a model from Firestore data
  factory MotorwaysAndDualCarriageways.fromFirestore(String id, Map<String, dynamic> data) {
    return MotorwaysAndDualCarriageways(
      id: id,
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      image: data['image'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
    );
  }
}
