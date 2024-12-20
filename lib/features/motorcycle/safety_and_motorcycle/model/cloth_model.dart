class Cloth {
  final String image;
  final String image1;
  final String image2;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  Cloth({
    required this.image,
    required this.image1,
    required this.image2,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  factory Cloth.fromJson(Map<String, dynamic> json) {
    return Cloth(
      image: json['image'],
      image1: json['image1'],
      image2: json['image2'],
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      tip: json['tip'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'image1': image1,
      'image2': image2,
      'points': points,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'tip': tip,
      'title': title,
    };
  }
}
