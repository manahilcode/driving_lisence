class HighwayCodeAlcoholDrugsModel {
  final List<String> points;
  final List<String> text;
  final String text1;

  HighwayCodeAlcoholDrugsModel({
    required this.points,
    required this.text,
    required this.text1,
  });

  factory HighwayCodeAlcoholDrugsModel.fromJson(Map<String, dynamic> json) {
    return HighwayCodeAlcoholDrugsModel(
      points: List<String>.from(json['points'] ?? []),
      text: List<String>.from(json['text'] ?? []),
      text1: json['text1'] ?? '',
    );
  }
}
