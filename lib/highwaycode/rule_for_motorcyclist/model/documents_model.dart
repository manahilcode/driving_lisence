class HighwayDocumentModel {
  final String text;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;
  final String text9;

  HighwayDocumentModel({
    required this.text,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
  });

  factory HighwayDocumentModel.fromJson(Map<String, dynamic> json) {
    return HighwayDocumentModel(
      text: json['text'] ?? '',
      text2: json['text2'] ?? '',
      text3: json['text3'] ?? '',
      text4: json['text4'] ?? '',
      text5: json['text5'] ?? '',
      text6: json['text6'] ?? '',
      text7: json['text7'] ?? '',
      text8: json['text8'] ?? '',
      text9: json['text9'] ?? '',
    );
  }
}
