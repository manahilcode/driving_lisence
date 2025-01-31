class WaitingAndParking {
  final String text;

  WaitingAndParking({required this.text});

  // Factory method to create an instance from a Firestore map
  factory WaitingAndParking.fromMap(Map<String, dynamic> map) {
    return WaitingAndParking(
      text: map['text'] ?? '',
    );
  }

  // Method to serialize the model into a map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
