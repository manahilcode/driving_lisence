class AntiLockBrakingSystem {
  final List<String> points;
  final String subtitle;
  final String title;

  AntiLockBrakingSystem({
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory AntiLockBrakingSystem.fromJson(Map<String, dynamic> json) {
    return AntiLockBrakingSystem(
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
