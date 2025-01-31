class HighwayCode11 {
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;

  HighwayCode11({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
  });

  factory HighwayCode11.fromFirestore(Map<String, dynamic> data) {
    return HighwayCode11(
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
      text3: data['text3'] ?? '',
      text4: data['text4'] ?? '',
      text5: data['text5'] ?? '',
    );
  }
}
