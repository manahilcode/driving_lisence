class HighwayBurns {
  final String text;

  HighwayBurns({
    required this.text,
  });

  factory HighwayBurns.fromMap(Map<String, dynamic> map) {
    return HighwayBurns(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
