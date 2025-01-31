class DrivingInBuiltUpArea {
  final String image;
  final List<String> points;
  final List<String> text;
  final List<String> text1;

  DrivingInBuiltUpArea({
    required this.image,
    required this.points,
    required this.text,
    required this.text1,
  });

  // Factory method to create an instance from a Firestore map
  factory DrivingInBuiltUpArea.fromMap(Map<String, dynamic> map) {
    return DrivingInBuiltUpArea(
      image: map['image'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      text: List<String>.from(map['text'] ?? []),
      text1: List<String>.from(map['text1'] ?? []),
    );
  }

  // Method to serialize the model into a map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'text': text,
      'text1': text1,
    };
  }
}
