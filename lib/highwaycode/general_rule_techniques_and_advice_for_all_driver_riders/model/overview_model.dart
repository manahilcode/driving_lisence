class HighwayOverview {
  final String text;

  HighwayOverview({
    required this.text,
  });

  // Factory constructor to create an instance from a Firestore document
  factory HighwayOverview.fromFirestore(Map<String, dynamic> doc) {
    return HighwayOverview(
      text: doc['text'] ?? '',
    );
  }

  // Convert the instance to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
