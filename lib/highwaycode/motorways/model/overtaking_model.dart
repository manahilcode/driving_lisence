class HighwayOvertakingModel {
  final String image;
  final List<String> points;
  final String text;
  final List<String> text1;

  HighwayOvertakingModel({
    required this.image,
    required this.points,
    required this.text,
    required this.text1,
  });

  factory HighwayOvertakingModel.fromJson(Map<String, dynamic> json) {
    return HighwayOvertakingModel(
      image: json['image'] ?? '',
      points: List<String>.from(json['points'] ?? []),
      text: json['text'] ?? '',
      text1: List<String>.from(json['text1'] ?? []),
    );
  }
}
