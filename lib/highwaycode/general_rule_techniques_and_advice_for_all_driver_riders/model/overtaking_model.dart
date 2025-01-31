class HighwayOvertaking {
  final String image;
  final List<String> points;
  final String text;

  HighwayOvertaking({
    required this.image,
    required this.points,
    required this.text,
  });

  // Factory constructor to create an instance from a Firestore document
  factory HighwayOvertaking.fromFirestore(Map<String, dynamic> doc) {
    return HighwayOvertaking(
      image: doc['image'] ?? '',
      points: List<String>.from(doc['points'] ?? []),
      text: doc['text'] ?? '',
    );
  }

  // Convert the instance to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'text': text,
    };
  }
}
