class ContraflowSystem {
  final String image;
  final List<String> points;
  final String tip;
  final String title;

  ContraflowSystem({
    required this.image,
    required this.points,
    required this.tip,
    required this.title,
  });

  factory ContraflowSystem.fromJson(Map<String, dynamic> json) {
    return ContraflowSystem(
      image: json['image'],
      points: List<String>.from(json['points']),
      tip: json['tip'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'tip': tip,
      'title': title,
    };
  }
}
