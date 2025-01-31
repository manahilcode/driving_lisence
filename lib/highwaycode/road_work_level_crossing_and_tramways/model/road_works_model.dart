class HighwaycodeRoadWorksModel {
  final List<String> points;
  final String text;

  HighwaycodeRoadWorksModel({
    required this.points,
    required this.text,
  });

  factory HighwaycodeRoadWorksModel.fromJson(Map<String, dynamic> json) {
    return HighwaycodeRoadWorksModel(
      points: List<String>.from(json['points'] ?? []),
      text: json['text'] ?? '',
    );
  }
}
