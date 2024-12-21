class SafetyMargin {
  final List<String> points;
  final String title;

  SafetyMargin({
    required this.points,
    required this.title,
  });

  factory SafetyMargin.fromJson(Map<String, dynamic> json) {
    return SafetyMargin(
      points: List<String>.from(json['points']),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'title': title,
    };
  }
}
