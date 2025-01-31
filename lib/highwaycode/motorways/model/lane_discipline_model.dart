class HighwayLaneDisciplineModel {
  final String text;
  final List<String> points;
  final List<String> text1;

  HighwayLaneDisciplineModel({
    required this.text,
    required this.points,
    required this.text1,
  });

  // Factory method to create an instance from Firestore data
  factory HighwayLaneDisciplineModel.fromMap(Map<String, dynamic> map) {
    return HighwayLaneDisciplineModel(
      text: map['text'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      text1: List<String>.from(map['text1'] ?? []),
    );
  }
}
