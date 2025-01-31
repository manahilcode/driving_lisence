// Model class for TheRoadUserAndTheLaw
class TheRoadUserAndTheLaw {
  final String text;
  final String text1;
  final String text2;

  TheRoadUserAndTheLaw({
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory constructor to create an instance from Firestore data
  factory TheRoadUserAndTheLaw.fromFirestore(Map<String, dynamic> data) {
    return TheRoadUserAndTheLaw(
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
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




