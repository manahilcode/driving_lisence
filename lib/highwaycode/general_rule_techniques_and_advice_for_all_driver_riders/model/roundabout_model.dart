class HighwayRoundabouts {
  final String image;
  final List<String> points;
  final List<String> points1;
  final List<String> points2;
  final List<String> text;
  final String text1;
  final List<String> text2;

  HighwayRoundabouts({
    required this.image,
    required this.points,
    required this.points1,
    required this.points2,
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwayRoundabouts.fromFirestore(Map<String, dynamic> doc) {
    return HighwayRoundabouts(
      image: doc['image'] ?? '',
      points: List<String>.from(doc['points'] ?? []),
      points1: List<String>.from(doc['points1'] ?? []),
      points2: List<String>.from(doc['points2'] ?? []),
      text: List<String>.from(doc['text'] ?? []),
      text1: doc['text1'] ?? '',
      text2: List<String>.from(doc['text2'] ?? []),
    );
  }

  // Convert the instance to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'points1': points1,
      'points2': points2,
      'text': text,
      'text1': text1,
      'text2': text2,
    };
  }
}
