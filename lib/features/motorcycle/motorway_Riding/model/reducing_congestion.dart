class TrafficManagementModel {
  final String image;
  final String image1;
  final List<String> point1;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String tip1;
  final String tip2;
  final String title;

  TrafficManagementModel({
    required this.image,
    required this.image1,
    required this.point1,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.tip1,
    required this.tip2,
    required this.title,
  });

  // Factory method to create an instance from Firestore document
  factory TrafficManagementModel.fromMap(Map<String, dynamic> map) {
    return TrafficManagementModel(
      image: map['image'],
      image1: map['image1'],
      point1: List<String>.from(map['point1']),
      subtitle: map['subtitle'],
      subtitle1: map['subtitle1'],
      tip: map['tip'],
      tip1: map['tip1'],
      tip2: map['tip2'],
      title: map['title'],
    );
  }

  // Method to convert the model to a Map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'image1': image1,
      'point1': point1,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'tip': tip,
      'tip1': tip1,
      'tip2': tip2,
      'title': title,
    };
  }
}
