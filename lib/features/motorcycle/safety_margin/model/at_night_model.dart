class NightRiding {
  final List<String> points;
  final String reflection;
  final String title;

  NightRiding({
    required this.points,
    required this.reflection,
    required this.title,
  });

  factory NightRiding.fromJson(Map<String, dynamic> json) {
    return NightRiding(
      points: List<String>.from(json['points']),
      reflection: json['reflection'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'reflection': reflection,
      'title': title,
    };
  }
}
