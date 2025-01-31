class OtherStoppingProcedures {
  final List<String> text;
  final List<String> text1;

  OtherStoppingProcedures({
    required this.text,
    required this.text1,
  });

  // Factory constructor to create an instance from a Firestore document
  factory OtherStoppingProcedures.fromFirestore(Map<String, dynamic> doc) {
    return OtherStoppingProcedures(
      text: List<String>.from(doc['text'] ?? []),
      text1: List<String>.from(doc['text1'] ?? []),
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
