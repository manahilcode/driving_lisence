class MotorcycleThinkAbout {
  final List<String> points;
  final String title;

  MotorcycleThinkAbout({
    required this.points,
    required this.title,
  });

  factory MotorcycleThinkAbout.fromJson(Map<String, dynamic> json) {
    return MotorcycleThinkAbout(
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
