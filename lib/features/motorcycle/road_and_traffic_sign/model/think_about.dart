class ThinkAboutSign {
  final List<String> points;
  final String title;

  ThinkAboutSign({
    required this.points,
    required this.title,
  });

  factory ThinkAboutSign.fromJson(Map<String, dynamic> json) {
    return ThinkAboutSign(
      points: List<String>.from(json['points'] as List),
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'title': title,
    };
  }
}
