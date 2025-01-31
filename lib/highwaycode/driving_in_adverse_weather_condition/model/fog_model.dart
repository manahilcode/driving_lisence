class HighwayFog {
  final List<String> points;
  final String text;
  final String text1;
  final String text2;

  HighwayFog({
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwayFog.fromMap(Map<String, dynamic> map) {
    return HighwayFog(
      points: List<String>.from(map['points'] ?? []),
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: map['text2'] ?? '',
    );
  }
}
