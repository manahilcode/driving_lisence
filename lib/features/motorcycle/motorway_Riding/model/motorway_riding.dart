class MotorwayRiding {
  final List<String> answer;
  final String correct;
  final String image;
  final String info;
  final List<String> points;
  final List<String> points1;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  MotorwayRiding({
    required this.answer,
    required this.correct,
    required this.image,
    required this.info,
    required this.points,
    required this.points1,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  // From Firestore data to Dart object
  factory MotorwayRiding.fromMap(Map<String, dynamic> map) {
    return MotorwayRiding(
      answer: List<String>.from(map['answer'] ?? []),
      correct: map['correct'] ?? '',
      image: map['image'] ?? '',
      info: map['info'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      question: map['question'] ?? '',
      subtitle: map['subtitle'] ?? '',
      subtitle1: map['subtitle1'] ?? '',
      tip: map['tip'] ?? '',
      title: map['title'] ?? '',
    );
  }

  // To Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'correct': correct,
      'image': image,
      'info': info,
      'points': points,
      'points1': points1,
      'question': question,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'tip': tip,
      'title': title,
    };
  }
}
