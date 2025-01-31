class HierarchyOfRoadUsers {
  final String heading;
  final String heading1;
  final String heading2;
  final String image;
  final String image1;
  final List<String> points1;
  final String text;
  final String text1;
  final String text2;

  HierarchyOfRoadUsers({
    required this.heading,
    required this.heading1,
    required this.heading2,
    required this.image,
    required this.image1,
    required this.points1,
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Convert Firestore document to model instance
  factory HierarchyOfRoadUsers.fromFirestore(Map<String, dynamic> data) {
    return HierarchyOfRoadUsers(
      heading: data['heading'] ?? '',
      heading1: data['heading1'] ?? '',
      heading2: data['heading2'] ?? '',
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      points1: List<String>.from(data['points1'] ?? []),
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
    );
  }

  // Convert model instance to a Map (if needed for Firestore writes)
  Map<String, dynamic> toMap() {
    return {
      'heading': heading,
      'heading1': heading1,
      'heading2': heading2,
      'image': image,
      'image1': image1,
      'points1': points1,
      'text': text,
      'text1': text1,
      'text2': text2,
    };
  }
}
