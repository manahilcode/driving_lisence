class ObservationAwarenessData {
  final String question;
  final List<String> answers;
  final String correctAnswer;
  final String info;
  final List<String> points;
  final String subtitle;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String image1;
  final String image2;
  final Map<String, String> definition;
  final Map<String, String> definition1;

  ObservationAwarenessData({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.info,
    required this.points,
    required this.subtitle,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.image1,
    required this.image2,
    required this.definition,
    required this.definition1,
  });

  factory ObservationAwarenessData.fromFirestore(Map<String, dynamic> json) {
    return ObservationAwarenessData(
      question: json['question'] as String,
      answers: List<String>.from(json['answer'] ?? []),
      correctAnswer: json['correct'] as String,
      info: json['info'] as String,
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      definition: Map<String, String>.from(json['defination'] ?? {}),
      definition1: Map<String, String>.from(json['defination1'] ?? {}),
    );
  }
}
