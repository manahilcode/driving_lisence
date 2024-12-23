class LaneAndJunction {
  final List<String> answers;
  final String correct;
  final String image;
  final String image1;
  final String info;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String subtitle3;
  final String subtitle4;
  final String tip;
  final String title;

  LaneAndJunction({
    required this.answers,
    required this.correct,
    required this.image,
    required this.image1,
    required this.info,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle3,
    required this.subtitle4,
    required this.tip,
    required this.title,
  });

  factory LaneAndJunction.fromMap(Map<String, dynamic> map) {
    return LaneAndJunction(
      answers: List<String>.from(map['answer']),
      correct: map['correct'] ?? '',
      image: map['image'] ?? '',
      image1: map['image1'] ?? '',
      info: map['info'] ?? '',
      question: map['question'] ?? '',
      subtitle: map['subtitle'] ?? '',
      subtitle1: map['subtitle1'] ?? '',
      subtitle3: map['subtitle3'] ?? '',
      subtitle4: map['subtitle4'] ?? '',
      tip: map['tip'] ?? '',
      title: map['title'] ?? '',
    );
  }
}
