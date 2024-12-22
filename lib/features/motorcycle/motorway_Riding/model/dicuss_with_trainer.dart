class TrainerPracticeModelRiding {
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  TrainerPracticeModelRiding({
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // Factory constructor to create the model from Firestore data
  factory TrainerPracticeModelRiding.fromMap(Map<String, dynamic> map) {
    return TrainerPracticeModelRiding(
      points: List<String>.from(map['points']),
      points1: List<String>.from(map['points1']),
      subtitle: map['subtitle'],
      title: map['title'],
      title1: map['title1'],
      title2: map['title2'],
    );
  }

  // Method to convert the model into a map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'points1': points1,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
