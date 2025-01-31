class OnPavements {
  final String text;
  final String text1;
  final String text2;

  OnPavements({
    required this.text,
    required this.text1,
    required this.text2,
  });

  factory OnPavements.fromFirestore(Map<String, dynamic> data) {
    return OnPavements(
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
    );
  }
}
