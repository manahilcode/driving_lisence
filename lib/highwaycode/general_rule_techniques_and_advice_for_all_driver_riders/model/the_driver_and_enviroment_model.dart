// Model class for TheDriverAndEnvironment
class TheDriverAndEnvironment {
  final String text;

  TheDriverAndEnvironment({
    required this.text,
  });

  // Factory constructor to create an instance from Firestore data
  factory TheDriverAndEnvironment.fromFirestore(Map<String, dynamic> data) {
    return TheDriverAndEnvironment(
      text: data['text'] ?? '',
    );
  }

  // Convert the instance to a map (for saving to Firestore if needed)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}



