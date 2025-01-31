class OverheadElectricLinesModel {
  final String image;
  final List<String> points;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;

  OverheadElectricLinesModel({
    required this.image,
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
  });

  factory OverheadElectricLinesModel.fromJson(Map<String, dynamic> json) {
    return OverheadElectricLinesModel(
      image: json['image'] ?? '',
      points: List<String>.from(json['points'] ?? []),
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
      text2: json['text2'] ?? '',
      text3: json['text3'] ?? '',
      text4: json['text4'] ?? '',
      text5: json['text5'] ?? '',
    );
  }
}
