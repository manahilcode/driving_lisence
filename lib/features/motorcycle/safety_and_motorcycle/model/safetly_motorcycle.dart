class SafetyYourMotorcycle {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;

  SafetyYourMotorcycle({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory SafetyYourMotorcycle.fromJson(Map<String, dynamic> json) {
    return SafetyYourMotorcycle(
      image: json['image'],
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
