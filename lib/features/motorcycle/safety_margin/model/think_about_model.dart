class SafetyMarginThinkAboutModel {
  String title;
  List<String> points;

  SafetyMarginThinkAboutModel({
    required this.title,
    required this.points,
  });

  factory SafetyMarginThinkAboutModel.fromJson(Map<String, dynamic> json) {
    return SafetyMarginThinkAboutModel(
      title: json['title'] ?? '',
      points: List<String>.from(json['points'] ?? []),
    );
  }
}
