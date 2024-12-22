class ThinkAboutModelRiding {
  final List<String> points;
  final String title;

  ThinkAboutModelRiding({
    required this.points,
    required this.title,
  });

  // Factory constructor to create the model from Firestore data
  factory ThinkAboutModelRiding.fromMap(Map<String, dynamic> map) {
    return ThinkAboutModelRiding(
      points: List<String>.from(map['points']),
      title: map['title'],
    );
  }

  // Method to convert the model into a map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'title': title,
    };
  }
}
