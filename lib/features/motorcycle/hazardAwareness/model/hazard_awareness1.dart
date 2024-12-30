class MotorcycleMotorcycleHazard {
  final String title;     // Title field
  final String subtitle;  // Subtitle field
  final String image;     // Main image URL
  final String? image1;   // Additional image 1 URL (nullable)
  final String? image2;   // Additional image 2 URL (nullable)
  final String? image3;   // Additional image 3 URL (nullable)
  final String text;      // Text description
  final String text1;     // Additional text description 1
  final String text2;     // Additional text description 2
  final String text3;     // Additional text description 3

  MotorcycleMotorcycleHazard({
    required this.title,
    required this.subtitle,
    required this.image,
    this.image1,        // Make these nullable (not required)
    this.image2,
    this.image3,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  // Factory method to create a model from Firestore data
  factory MotorcycleMotorcycleHazard.fromFirestore(Map<String, dynamic> data) {
    return MotorcycleMotorcycleHazard(
      title: data['title'] ?? 'Untitled',    // Provide default if null
      subtitle: data['subtitle'] ?? 'No Subtitle',
      image: data['image'] ?? 'default_image_url',  // Default image URL
      image1: data['image1'] as String?,    // Nullable field
      image2: data['image2'] as String?,
      image3: data['image3'] as String?,
      text: data['text'] ?? 'No description available', // Default text if null
      text1: data['text1'] ?? 'No additional text',
      text2: data['text2'] ?? 'No additional text',
      text3: data['text3'] ?? 'No additional text',
    );
  }
}
