class StandardsModelIncident {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  StandardsModelIncident({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // Factory method to create StandardsModel from a JSON-like map
  factory StandardsModelIncident.fromMap(Map<String, dynamic> map) {
    return StandardsModelIncident(
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      title: map['title'] as String,
      title1: map['title1'] as String,
      title2: map['title2'] as String,
    );
  }

  // Convert StandardsModel to a JSON-like map
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'points1': points1,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
