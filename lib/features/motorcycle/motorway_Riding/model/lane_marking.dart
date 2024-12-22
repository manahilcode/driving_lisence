class LaneMarkingRiding {
  final String image;
  final String subtitle;
  final String title;

  LaneMarkingRiding({
    required this.image,
    required this.subtitle,
    required this.title,
  });

  // From Firestore data to Dart object
  factory LaneMarkingRiding.fromMap(Map<String, dynamic> map) {
    return LaneMarkingRiding(
      image: map['image'] ?? '',
      subtitle: map['subtitle'] ?? '',
      title: map['title'] ?? '',
    );
  }

  // To Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
