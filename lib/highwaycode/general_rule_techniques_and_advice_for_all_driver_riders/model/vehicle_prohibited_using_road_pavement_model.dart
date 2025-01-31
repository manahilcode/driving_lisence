class ProhibitedVehicle {
  final String text;
  final String text1;

  ProhibitedVehicle({
    required this.text,
    required this.text1,
  });

  // Convert Firestore document into a ProhibitedVehicle instance
  factory ProhibitedVehicle.fromFirestore(Map<String, dynamic> firestoreData) {
    return ProhibitedVehicle(
      text: firestoreData['text'] ?? '',
      text1: firestoreData['text1'] ?? '',
    );
  }

  // Convert ProhibitedVehicle instance to map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
    };
  }
}
