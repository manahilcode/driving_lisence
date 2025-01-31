class HighwayReversing {
  final String image;
  final List<String> points;
  final String text;
  final String text1;

  HighwayReversing({
    required this.image,
    required this.points,
    required this.text,
    required this.text1,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwayReversing.fromFirestore(Map<String, dynamic> doc) {
    return HighwayReversing(
      image: doc['image'] ?? '',
      points: List<String>.from(doc['points'] ?? []),
      text: doc['text'] ?? '',
      text1: doc['text1'] ?? '',
    );
  }

  // Convert the instance to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'text': text,
      'text1': text1,
    };
  }
}
