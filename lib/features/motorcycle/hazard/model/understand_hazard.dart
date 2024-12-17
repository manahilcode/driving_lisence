class UnderstandingHazardsModel {
  final List<String> points;
  final String subtitle;
  final String title;

  UnderstandingHazardsModel({
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory UnderstandingHazardsModel.fromJson(Map<String, dynamic> json) {
    return UnderstandingHazardsModel(
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
