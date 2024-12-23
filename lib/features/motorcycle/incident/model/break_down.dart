class BreakdownModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String tip;
  final String tip1;
  final String tip2;
  final String title;

  BreakdownModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.tip,
    required this.tip1,
    required this.tip2,
    required this.title,
  });

  factory BreakdownModel.fromJson(Map<String, dynamic> json) {
    return BreakdownModel(
      image: json['image'],
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      subtitle2: json['subtitle2'],
      tip: json['tip'],
      tip1: json['tip1'],
      tip2: json['tip2'],
      title: json['title'],
    );
  }
}
