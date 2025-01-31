class HighwayCrossingModel {
  final String image;
  final List<String> text;
  final List<String> text1;
  final List<String> text10;
  final List<String> text11;
  final List<String> text12;
  final List<String> text13;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;
  final List<String> text6;
  final List<String> text7;
  final List<String> text8;
  final List<String> text9;

  HighwayCrossingModel({
    required this.image,
    required this.text,
    required this.text1,
    required this.text10,
    required this.text11,
    required this.text12,
    required this.text13,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
  });

  factory HighwayCrossingModel.fromMap(Map<String, dynamic> data) {
    return HighwayCrossingModel(
      image: data['image'] ?? '',
      text: List<String>.from(data['text'] ?? []),
      text1: List<String>.from(data['text1'] ?? []),
      text10: List<String>.from(data['text10'] ?? []),
      text11: List<String>.from(data['text11'] ?? []),
      text12: List<String>.from(data['text12'] ?? []),
      text13: List<String>.from(data['text13'] ?? []),
      text2: List<String>.from(data['text2'] ?? []),
      text3: List<String>.from(data['text3'] ?? []),
      text4: List<String>.from(data['text4'] ?? []),
      text5: List<String>.from(data['text5'] ?? []),
      text6: List<String>.from(data['text6'] ?? []),
      text7: List<String>.from(data['text7'] ?? []),
      text8: List<String>.from(data['text8'] ?? []),
      text9: List<String>.from(data['text9'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'text': text,
      'text1': text1,
      'text10': text10,
      'text11': text11,
      'text12': text12,
      'text13': text13,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
      'text6': text6,
      'text7': text7,
      'text8': text8,
      'text9': text9,
    };
  }
}
