// Model class for SignalControlledCrossings
class SignalControlledCrossings {
  final String image;
  final List<String> text;
  final String text1;
  final String text2;

  SignalControlledCrossings({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory constructor to create an instance from Firestore data
  factory SignalControlledCrossings.fromFirestore(Map<String, dynamic> data) {
    return SignalControlledCrossings(
      image: data['image'] ?? '',
      text: List<String>.from(data['text'] ?? []),
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
    );
  }

  // Convert the instance to a map (for saving to Firestore if needed)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'text': text,
      'text1': text1,
      'text2': text2,
    };
  }
}



