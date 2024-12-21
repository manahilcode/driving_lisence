class SafetyMarginDiscussModel {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  SafetyMarginDiscussModel({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // Factory constructor to create an object from Firestore document
  factory SafetyMarginDiscussModel.fromFirestore(Map<String, dynamic> data) {
    return SafetyMarginDiscussModel(
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
    );
  }
}
