class IncidentModelIncident {
  final String image;
  final List<String> points;
  final String title;

  IncidentModelIncident({
    required this.image,
    required this.points,
    required this.title,
  });

  // Factory method to create IncidentModel from a JSON-like map
  factory IncidentModelIncident.fromMap(Map<String, dynamic> map) {
    return IncidentModelIncident(
      image: map['image'] as String,
      points: List<String>.from(map['points'] ?? []),
      title: map['title'] as String,
    );
  }

  // Convert IncidentModel to a JSON-like map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
