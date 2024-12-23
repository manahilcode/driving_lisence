class CrossroadRule
{
  final String image;
  final String image1;
  final List<String> points;
  final String subtitle;
  final String title;
  final String title1;

  CrossroadRule({
    required this.image,
    required this.image1,
    required this.points,
    required this.subtitle,
    required this.title,
    required this.title1,
  });

  factory CrossroadRule.fromMap(Map<String, dynamic> map) {
    return CrossroadRule(
      image: map['image'],
      image1: map['image1'],
      points: List<String>.from(map['points']),
      subtitle: map['subtitle'],
      title: map['title'],
      title1: map['title1'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'image1': image1,
      'points': points,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
    };
  }
}
