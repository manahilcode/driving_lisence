class MotorwayRidingModelRiding {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String title;

  MotorwayRidingModelRiding({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  // Factory method to create an instance from Firestore document
  factory MotorwayRidingModelRiding.fromMap(Map<String, dynamic> map) {
    return MotorwayRidingModelRiding(
      image: map['image'],
      points: List<String>.from(map['points']),
      subtitle: map['subtitle'],
      subtitle1: map['subtitle1'],
      title: map['title'],
    );
  }

  // Method to convert the model to a Map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
    };
  }
}
