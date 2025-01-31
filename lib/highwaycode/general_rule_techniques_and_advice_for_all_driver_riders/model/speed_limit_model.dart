// Model class for HighwaySpeedLimits
class HighwaySpeedLimits {
  final String image;
  final String image1;
  final List<String> text;
  final List<String> text1;

  HighwaySpeedLimits({
    required this.image,
    required this.image1,
    required this.text,
    required this.text1,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwaySpeedLimits.fromFirestore(Map<String, dynamic> data) {
    return HighwaySpeedLimits(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      text: List<String>.from(data['text'] ?? []),
      text1: List<String>.from(data['text1'] ?? []),
    );
  }

  // Convert the instance to a map (for saving to Firestore if needed)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'image1': image1,
      'text': text,
      'text1': text1,
    };
  }
}




