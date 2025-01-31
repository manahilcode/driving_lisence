class PlaceOfRelativeSafety {
  final String text;
  final String text1;
  final String text2;

  PlaceOfRelativeSafety({
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory constructor to create an instance from Firestore data
  factory PlaceOfRelativeSafety.fromMap(Map<String, dynamic> map) {
    return PlaceOfRelativeSafety(
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: map['text2'] ?? '',
    );
  }
}
