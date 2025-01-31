class HighwayMotorwaySignalsModel {
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final List<String> points;
  final List<String> points2;
  final String text;
  final String text1;

  HighwayMotorwaySignalsModel({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.points2,
    required this.text,
    required this.text1,
  });

  // Factory method to create an instance from Firestore data
  factory HighwayMotorwaySignalsModel.fromMap(Map<String, dynamic> map) {
    return HighwayMotorwaySignalsModel(
      image: map['image'] ?? '',
      image1: map['image1'] ?? '',
      image2: map['image2'] ?? '',
      image3: map['image3'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      points2: List<String>.from(map['points2'] ?? []),
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
    );
  }
}
