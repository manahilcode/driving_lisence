// Model class for HighwayUsingRoad
class HighwayUsingRoad {
  final String image;
  final List<String> points;
  final List<String> points1;
  final List<String> points3;

  HighwayUsingRoad({
    required this.image,
    required this.points,
    required this.points1,
    required this.points3,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwayUsingRoad.fromFirestore(Map<String, dynamic> data) {
    return HighwayUsingRoad(
      image: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      points3: List<String>.from(data['points3'] ?? []),
    );
  }

  // Convert the instance to a map (for saving to Firestore if needed)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'points1': points1,
      'points3': points3,
    };
  }
}

