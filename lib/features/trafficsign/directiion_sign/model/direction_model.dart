class SignData {
  final String text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;

  SignData({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  factory SignData.fromMap(Map<String, dynamic> data) {
    return SignData(
      text: data['text'] ?? '',
      text1: List<String>.from(data['text1'] ?? []),
      text2: List<String>.from(data['text2'] ?? []),
      text3: List<String>.from(data['text3'] ?? []),
    );
  }
}