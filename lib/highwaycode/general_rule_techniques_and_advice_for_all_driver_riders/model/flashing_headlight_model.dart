class FlashingHeadlights {
  final List<String> text;
  final List<String> text1;

  FlashingHeadlights({
    required this.text,
    required this.text1,
  });

  factory FlashingHeadlights.fromMap(Map<String, dynamic> map) {
    return FlashingHeadlights(
      text: List<String>.from(map['text'] ?? []),
      text1: List<String>.from(map['text1'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
    };
  }
}
