class IncidentReportModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;

  IncidentReportModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  // Factory method to create IncidentReportModel from a JSON-like map
  factory IncidentReportModel.fromMap(Map<String, dynamic> map) {
    return IncidentReportModel(
      image: map['image'] as String,
      points: List<String>.from(map['points'] ?? []),
      subtitle: map['subtitle'] as String,
      title: map['title'] as String,
    );
  }

  // Convert IncidentReportModel to a JSON-like map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
