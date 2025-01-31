class MotorcycleLicenceRequirementsModel {
  final List<String> points;
  final String text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;

  MotorcycleLicenceRequirementsModel({
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
  });

  factory MotorcycleLicenceRequirementsModel.fromJson(Map<String, dynamic> json) {
    return MotorcycleLicenceRequirementsModel(
      points: List<String>.from(json['points'] ?? []),
      text: json['text'] ?? '',
      text1: List<String>.from(json['text1'] ?? []),
      text2: List<String>.from(json['text2'] ?? []),
      text3: List<String>.from(json['text3'] ?? []),
      text4: List<String>.from(json['text4'] ?? []),
      text5: List<String>.from(json['text5'] ?? []),
    );
  }
}
