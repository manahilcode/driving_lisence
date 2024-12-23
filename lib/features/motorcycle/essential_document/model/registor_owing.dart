class RegistorOwing {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String title;

  RegistorOwing({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  factory RegistorOwing.fromMap(Map<String, dynamic> map) {
    return RegistorOwing(
      image: map['image'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      subtitle: map['subtitle'] ?? '',
      subtitle1: map['subtitle1'] ?? '',
      title: map['title'] ?? '',
    );
  }
}
