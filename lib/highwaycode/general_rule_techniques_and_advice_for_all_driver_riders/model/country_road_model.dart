class HighwayCountryRoads {
  final String text;
  final List<String> text1;

  HighwayCountryRoads({
    required this.text,
    required this.text1,
  });

  // Factory method to create an instance from Firestore map
  factory HighwayCountryRoads.fromMap(Map<String, dynamic> map) {
    return HighwayCountryRoads(
      text: map['text'] ?? '',
      text1: List<String>.from(map['text1'] ?? []),
    );
  }

  // Method to serialize the model into a map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
    };
  }
}
