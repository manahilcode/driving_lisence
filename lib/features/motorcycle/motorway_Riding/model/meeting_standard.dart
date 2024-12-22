class MeetingStandardRiding {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  MeetingStandardRiding({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // From Firestore data to Dart object
  factory MeetingStandardRiding.fromMap(Map<String, dynamic> map) {
    return MeetingStandardRiding(
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      title: map['title'] ?? '',
      title1: map['title1'] ?? '',
      title2: map['title2'] ?? '',
    );
  }

  // To Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'points1': points1,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
