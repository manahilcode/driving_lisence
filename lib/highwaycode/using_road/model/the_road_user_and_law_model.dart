class RoadUserAndTheLaw {
  final String text;
  final String text1;

  RoadUserAndTheLaw({
    required this.text,
    required this.text1,
  });

  factory RoadUserAndTheLaw.fromFirestore(Map<String, dynamic> data) {
    return RoadUserAndTheLaw(
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
    );
  }
}
