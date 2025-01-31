class HighwayCodeDocument1122 {
  final List<String> text;
  final String text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;
  final List<String> text6;
  final List<String> text7;
  final List<String> text8;

  HighwayCodeDocument1122({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
  });

  factory HighwayCodeDocument1122.fromJson(Map<String, dynamic> json) {
    return HighwayCodeDocument1122(
      text: List<String>.from(json['text'] as List),
      text1: json['text1'] as String,
      text2: List<String>.from(json['text2'] as List),
      text3: List<String>.from(json['text3'] as List),
      text4: List<String>.from(json['text4'] as List),
      text5: List<String>.from(json['text5'] as List),
      text6: List<String>.from(json['text6'] as List),
      text7: List<String>.from(json['text7'] as List),
      text8: List<String>.from(json['text8'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
      'text6': text6,
      'text7': text7,
      'text8': text8,
    };
  }
}
