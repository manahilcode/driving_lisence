class Security {
  final Map<String, String> image;
  final Map<String, String> image1;
  final Map<String, String> image2;
  final Map<String, String> image3;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String title;

  Security({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  factory Security.fromJson(Map<String, dynamic> json) {
    return Security(
      image: json['image'],
      image1: Map<String, String>.from(json['image1']),
      image2: Map<String, String>.from(json['image2']),
      image3: Map<String, String>.from(json['image3']),
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'points': points,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
    };
  }
}
