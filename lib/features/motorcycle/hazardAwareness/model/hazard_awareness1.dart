class MotorcycleMotorcycleHazard {
  final String id; // Document ID
  final String title; // Title field
  final String subtitle; // Subtitle field
  final String image; // Main image URL
  final String image1; // Additional image 1 URL
  final String image2; // Additional image 2 URL
  final String image3; // Additional image 3 URL
  final String text; // Text description
  final String text1; // Additional text description 1
  final String text2; // Additional text description 2
  final String text3; // Additional text description 3

  MotorcycleMotorcycleHazard({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  // Factory method to create a model from Firestore data
  factory MotorcycleMotorcycleHazard.fromFirestore(String id, Map<String, dynamic> data) {
    return MotorcycleMotorcycleHazard(
      id: id,
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
      text3: data['text3'] ?? '',
    );
  }
}
