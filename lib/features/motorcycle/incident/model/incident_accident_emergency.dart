class IncidentModel {
  final String image;
  final List<String> points;
  final String title;

  IncidentModel({
    required this.image,
    required this.points,
    required this.title,
  });

  // Factory method to create an IncidentModel from a JSON-like map
  factory IncidentModel.fromMap(Map<String, dynamic> map) {
    return IncidentModel(
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
