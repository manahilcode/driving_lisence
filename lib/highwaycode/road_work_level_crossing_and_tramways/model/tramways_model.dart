class HighwaycodeTramwaysModel {
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;

  HighwaycodeTramwaysModel({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
  });

  factory HighwaycodeTramwaysModel.fromJson(Map<String, dynamic> json) {
    return HighwaycodeTramwaysModel(
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
      text2: json['text2'] ?? '',
      text3: json['text3'] ?? '',
      text4: json['text4'] ?? '',
      text5: json['text5'] ?? '',
      text6: json['text6'] ?? '',
    );
  }
}
