class HighwayRoadJunctions {
  final String image;
  final List<String> points;

  HighwayRoadJunctions({
    required this.image,
    required this.points,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwayRoadJunctions.fromFirestore(Map<String, dynamic> doc) {
    return HighwayRoadJunctions(
      image: doc['image'] ?? '',
      points: List<String>.from(doc['points'] ?? []),
    );
  }

  // Convert the instance to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
    };
  }
}
