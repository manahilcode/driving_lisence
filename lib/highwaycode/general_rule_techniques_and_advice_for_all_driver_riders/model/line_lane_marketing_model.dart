class LinesAndLaneMarkings {
  final List<String> points;
  final List<String> text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;

  LinesAndLaneMarkings({
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  factory LinesAndLaneMarkings.fromMap(Map<String, dynamic> map) {
    return LinesAndLaneMarkings(
      points: List<String>.from(map['points'] ?? []),
      text: List<String>.from(map['text'] ?? []),
      text1: List<String>.from(map['text1'] ?? []),
      text2: List<String>.from(map['text2'] ?? []),
      text3: List<String>.from(map['text3'] ?? []),
      text4: List<String>.from(map['text4'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
    };
  }
}
