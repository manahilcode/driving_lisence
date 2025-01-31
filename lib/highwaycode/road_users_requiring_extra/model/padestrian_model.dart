class HighwayPedestriansModel {
  final String header;
  final String image;
  final List<String> points;
  final List<String> points1;
  final String text;

  HighwayPedestriansModel({
    required this.header,
    required this.image,
    required this.points,
    required this.points1,
    required this.text,
  });

  factory HighwayPedestriansModel.fromJson(Map<String, dynamic> json) {
    return HighwayPedestriansModel(
      header: json['header'] ?? '',
      image: json['image'] ?? '',
      points: List<String>.from(json['points'] ?? []),
      points1: List<String>.from(json['points1'] ?? []),
      text: json['text'] ?? '',
    );
  }
}
