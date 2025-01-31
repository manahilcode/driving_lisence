class DualCarriageways {
  final String text;
  final String text1;
  final String text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;
  final List<String> text6;
  final List<String> text7;

  DualCarriageways({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
  });

  factory DualCarriageways.fromMap(Map<String, dynamic> map) {
    return DualCarriageways(
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: map['text2'] ?? '',
      text3: List<String>.from(map['text3'] ?? []),
      text4: List<String>.from(map['text4'] ?? []),
      text5: List<String>.from(map['text5'] ?? []),
      text6: List<String>.from(map['text6'] ?? []),
      text7: List<String>.from(map['text7'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
      'text6': text6,
      'text7': text7,
    };
  }
}
