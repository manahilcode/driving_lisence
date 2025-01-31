class SelfDrivingModel {
  final String text;
  final String text1;
  final String text2;
  final List<String> points;

  SelfDrivingModel({
    required this.text,
    required this.text1,
    required this.text2,
    required this.points,
  });

  // Factory constructor to create an instance from a Firestore document
  factory SelfDrivingModel.fromMap(Map<String, dynamic> map) {
    return SelfDrivingModel(
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: map['text2'] ?? '',
      points: List<String>.from(map['points'] ?? []),
    );
  }
}
