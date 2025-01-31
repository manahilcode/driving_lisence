class MultiLaneCarriageways {
  final String text;
  final String text1;

  MultiLaneCarriageways({
    required this.text,
    required this.text1,
  });

  // Factory constructor to create an instance from a Firestore document
  factory MultiLaneCarriageways.fromFirestore(Map<String, dynamic> doc) {
    return MultiLaneCarriageways(
      text: doc['text'] ?? '',
      text1: doc['text1'] ?? '',
    );
  }

  // Convert the instance to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
    };
  }
}
