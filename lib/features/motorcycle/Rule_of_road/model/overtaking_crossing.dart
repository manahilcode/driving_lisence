// Model Class
class OvertakingCrossings {
  final String image;
  final String image1;
  final String image2;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;
  final String title1;

  OvertakingCrossings({
    required this.image,
    required this.image1,
    required this.image2,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
    required this.title1,
  });

  factory OvertakingCrossings.fromMap(Map<String, dynamic> map) {
    return OvertakingCrossings(
      image: map['image'] ?? '',
      image1: map['image1'] ?? '',
      image2: map['image2'] ?? '',
      subtitle: map['subtitle'] ?? '',
      subtitle1: map['subtitle1'] ?? '',
      tip: map['tip'] ?? '',
      title: map['title'] ?? '',
      title1: map['title1'] ?? '',
    );
  }
}