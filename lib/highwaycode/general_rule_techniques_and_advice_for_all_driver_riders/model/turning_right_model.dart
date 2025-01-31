// Model class for HighwayTurningRight
class HighwayTurningRight {
  final String image;
  final List<String> points;
  final String text;

  HighwayTurningRight({
    required this.image,
    required this.points,
    required this.text,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwayTurningRight.fromFirestore(Map<String, dynamic> data) {
    return HighwayTurningRight(
      image: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      text: data['text'] ?? '',
    );
  }

  // Convert the instance to a map (for saving to Firestore if needed)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'text': text,
    };
  }
}



