class InsuranceDetails {
  final String image;
  final List<String> points;
  final String subtitle;
  final String tip;
  final String title;

  InsuranceDetails({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory InsuranceDetails.fromJson(Map<String, dynamic> json) {
    return InsuranceDetails(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List),
      subtitle: json['subtitle'] as String,
      tip: json['tip'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'tip': tip,
      'title': title,
    };
  }
}
