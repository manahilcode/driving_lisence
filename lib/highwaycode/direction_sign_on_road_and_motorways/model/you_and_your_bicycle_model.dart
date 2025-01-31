class YouAndYourBicycle {
  final List<String> points;
  final String text;

  YouAndYourBicycle({
    required this.points,
    required this.text,
  });

  // Factory constructor to create an instance from Firestore data
  factory YouAndYourBicycle.fromMap(Map<String, dynamic> map) {
    return YouAndYourBicycle(
      points: List<String>.from(map['points'] ?? []),
      text: map['text'] ?? '',
    );
  }
}
