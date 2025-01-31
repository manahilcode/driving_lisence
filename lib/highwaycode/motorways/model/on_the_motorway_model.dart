class HighwayMotorwayModel {
  final List<String> points;
  final List<String> points1;
  final String text;

  HighwayMotorwayModel({
    required this.points,
    required this.points1,
    required this.text,
  });

  factory HighwayMotorwayModel.fromJson(Map<String, dynamic> json) {
    return HighwayMotorwayModel(
      points: List<String>.from(json['points'] ?? []),
      points1: List<String>.from(json['points1'] ?? []),
      text: json['text'] ?? '',
    );
  }
}
