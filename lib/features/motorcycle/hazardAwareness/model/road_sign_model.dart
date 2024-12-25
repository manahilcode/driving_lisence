class RoadSigns {
  final String title;               // Main title
  final String subtitle;            // Subtitle for road signs
  final String subtitle1;           // Subtitle related to parked vehicles
  final String subtitle3;           // Subtitle related to junctions
  final String title1;              // Title for parked vehicles
  final String title3;              // Title for junctions
  final String image;               // Main image URL
  final String image1;              // Additional image URL
  final List<String> points;        // List of points describing hazards

  RoadSigns({

    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle3,
    required this.title1,
    required this.title3,
    required this.image,
    required this.image1,
    required this.points,
  });

  // Factory method to create a model from Firestore data
  factory RoadSigns.fromFirestore( Map<String, dynamic> data) {
    return RoadSigns(
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      title1: data['title1'] ?? '',
      title3: data['title3'] ?? '',
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      points: List<String>.from(data['point'] ?? []),
    );
  }
}
