class MovingHazards {
  final String title; // Main title
  final String title1; // Cyclists title
  final String title2; // Horse riders title
  final String title3; // Drivers of large vehicles title
  final String image; // Pedestrians image
  final String image1; // Cyclists image
  final String image2; // Horse riders image
  final String image3; // Drivers of large vehicles image
  final String subtitle; // Pedestrians subtitle
  final String subtitle1; // Cyclists subtitle
  final String subtitle2; // Horse riders subtitle
  final String subtitle3; // Drivers of large vehicles subtitle

  MovingHazards({

    required this.title,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
  });

  // Factory method to create a model from Firestore data
  factory MovingHazards.fromFirestore( Map<String, dynamic> data) {
    return MovingHazards(

      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
      title3: data['title3'] ?? '',
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
    );
  }
}
