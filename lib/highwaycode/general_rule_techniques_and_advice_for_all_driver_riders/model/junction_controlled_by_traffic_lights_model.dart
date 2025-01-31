class JunctionsControlledByTrafficLights {
  final String image;
  final String text;
  final String text1;
  final List<String> text2;

  JunctionsControlledByTrafficLights({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
  });

  factory JunctionsControlledByTrafficLights.fromMap(Map<String, dynamic> map) {
    return JunctionsControlledByTrafficLights(
      image: map['image'] ?? '',
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: List<String>.from(map['text2'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'text': text,
      'text1': text1,
      'text2': text2,
    };
  }
}
