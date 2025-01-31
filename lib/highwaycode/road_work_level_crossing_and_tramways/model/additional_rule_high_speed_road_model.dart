class AdditionalRulesHighSpeedRoadsModel {
  final List<String> points;
  final List<String> text;
  final List<String> text1;
  final List<String> text2;

  AdditionalRulesHighSpeedRoadsModel({
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
  });

  factory AdditionalRulesHighSpeedRoadsModel.fromJson(Map<String, dynamic> json) {
    return AdditionalRulesHighSpeedRoadsModel(
      points: List<String>.from(json['points'] ?? []),
      text: List<String>.from(json['text'] ?? []),
      text1: List<String>.from(json['text1'] ?? []),
      text2: List<String>.from(json['text2'] ?? []),
    );
  }
}
