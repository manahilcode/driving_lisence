// Model class for HighwaySignals
class HighwaySignals {
  final List<String> text;
  final String text1;
  final List<String> text2;

  HighwaySignals({
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory constructor to create an instance from Firestore data
  factory HighwaySignals.fromFirestore(Map<String, dynamic> data) {
    return HighwaySignals(
      text: List<String>.from(data['text'] ?? []),
      text1: data['text1'] ?? '',
      text2: List<String>.from(data['text2'] ?? []),
    );
  }

  // Convert the instance to a map (for saving to Firestore if needed)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
    };
  }
}
