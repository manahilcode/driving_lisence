
class WordingOfHighwayCodeModel11 {
  final String text;

  WordingOfHighwayCodeModel11({required this.text});

  // Factory constructor to create an instance from Firestore data
  factory WordingOfHighwayCodeModel11.fromMap(Map<String, dynamic> map) {
    return WordingOfHighwayCodeModel11(
      text: map['text'] ?? '',
    );
  }
}
