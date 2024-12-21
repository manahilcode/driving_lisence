class RoadConditionHazardAwareness {
  final String id;                // Document ID
  final String title;             // Main title
  final String subtitle;          // Primary subtitle
  final String subtitle2;         // Secondary subtitle
  final ImageData image;          // Main image
  final ImageData image1;         // First additional image
  final ImageData image2;         // Second additional image
  final ImageData image3;         // Third additional image

  RoadConditionHazardAwareness({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  // Factory method to create a model from Firestore data
  factory RoadConditionHazardAwareness.fromFirestore(String id, Map<String, dynamic> data) {
    return RoadConditionHazardAwareness(
      id: id,
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      image: ImageData.fromFirestore(data['image'] ?? {}),
      image1: ImageData.fromFirestore(data['image1'] ?? {}),
      image2: ImageData.fromFirestore(data['image2'] ?? {}),
      image3: ImageData.fromFirestore(data['image3'] ?? {}),
    );
  }
}
class ImageData {
  final String imageUrl; // URL of the image
  final String text;     // Description or related text for the image

  ImageData({
    required this.imageUrl,
    required this.text,
  });

  // Factory method to create an instance from Firestore data
  factory ImageData.fromFirestore(Map<String, dynamic> data) {
    return ImageData(
      imageUrl: data['image'] ?? '',
      text: data['text'] ?? '',
    );
  }
}
