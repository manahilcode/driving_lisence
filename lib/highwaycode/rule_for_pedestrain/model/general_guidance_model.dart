class HighwayCodeGeneralGuidance11 {
  final String image;
  final List<String> text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text4;
  final List<String> text5;

  HighwayCodeGeneralGuidance11({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text4,
    required this.text5,
  });

  factory HighwayCodeGeneralGuidance11.fromFirestore(Map<String, dynamic> data) {
    return HighwayCodeGeneralGuidance11(
      image: data['image'] ?? '',
      text: List<String>.from(data['text'] ?? []),
      text1: List<String>.from(data['text1'] ?? []),
      text2: List<String>.from(data['text2'] ?? []),
      text4: List<String>.from(data['text4'] ?? []),
      text5: List<String>.from(data['text5'] ?? []),
    );
  }
}
