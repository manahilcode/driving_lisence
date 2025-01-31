class SituationsNeedingExtraCare {
  final List<String> text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;

  SituationsNeedingExtraCare({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  factory SituationsNeedingExtraCare.fromFirestore(Map<String, dynamic> data) {
    return SituationsNeedingExtraCare(
      text: List<String>.from(data['text'] ?? []),
      text1: List<String>.from(data['text1'] ?? []),
      text2: List<String>.from(data['text2'] ?? []),
      text3: List<String>.from(data['text3'] ?? []),
      text4: List<String>.from(data['text4'] ?? []),
    );
  }
}
