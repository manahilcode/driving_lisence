class IncidentAdvice {
  final List<String> points;
  final String text;
  final String text1;

  IncidentAdvice({
    required this.points,
    required this.text,
    required this.text1,
  });

  factory IncidentAdvice.fromMap(Map<String, dynamic> map) {
    return IncidentAdvice(
      points: List<String>.from(map['points'] ?? []),
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'text': text,
      'text1': text1,
    };
  }
}
