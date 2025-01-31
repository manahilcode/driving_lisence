class HighwayParking {
  final String image;
  final List<String> points;
  final String text;
  final String text1;
  final String text2;
  final List<String> text3;

  HighwayParking({
    required this.image,
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  factory HighwayParking.fromJson(Map<String, dynamic> json) {
    return HighwayParking(
      image: json['image'] as String,
      points: List<String>.from(json['points']),
      text: json['text'] as String,
      text1: json['text1'] as String,
      text2: json['text2'] as String,
      text3: List<String>.from(json['text3']),
    );
  }
}
