class MotTestDetails {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;

  MotTestDetails({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory MotTestDetails.fromJson(Map<String, dynamic> json) {
    return MotTestDetails(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
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
