class MotorcycleLicence {
  final String image;
  final String image1;
  final List<String> points;
  final String subtitle;
  final String tip;
  final String title;

  MotorcycleLicence({
    required this.image,
    required this.image1,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory MotorcycleLicence.fromMap(Map<String, dynamic> map) {
    return MotorcycleLicence(
      image: map['image'] ?? '',
      image1: map['image1'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      subtitle: map['subtitle'] ?? '',
      tip: map['tip'] ?? '',
      title: map['title'] ?? '',
    );
  }
}
