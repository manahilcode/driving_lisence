class ThinkAboutModelIncident {
  final List<String> points;
  final String title;

  ThinkAboutModelIncident({
    required this.points,
    required this.title,
  });

  // Factory method to create ThinkAboutModel from a JSON-like map
  factory ThinkAboutModelIncident.fromMap(Map<String, dynamic> map) {
    return ThinkAboutModelIncident(
      points: List<String>.from(map['points'] ?? []),
      title: map['title'] as String,
    );
  }

  // Convert ThinkAboutModel to a JSON-like map
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'title': title,
    };
  }
}
