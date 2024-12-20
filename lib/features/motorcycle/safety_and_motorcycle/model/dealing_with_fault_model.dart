class DealingWithFaultModel {
  final String wheelBalancing;
  final List<String> answer;
  final String correct;
  final String image;
  final List<String> image1;
  final String info;
  final List<String> points;
  final List<String> points1;
  final String question;
  final String subtitle;
  final String tip;
  final String title;

  DealingWithFaultModel({
    required this.wheelBalancing,
    required this.answer,
    required this.correct,
    required this.image,
    required this.image1,
    required this.info,
    required this.points,
    required this.points1,
    required this.question,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory DealingWithFaultModel.fromFirestore(Map<String, dynamic> data) {
    return DealingWithFaultModel(
      wheelBalancing: data['wheel_balancing'] as String,
      answer: List<String>.from(data['answer'] ?? []),
      correct: data['correct'] as String,
      image: data['image'] as String,
      image1: List<String>.from(data['image1'] ?? []),
      info: data['info'] as String,
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      question: data['question'] as String,
      subtitle: data['subtitle'] as String,
      tip: data['tip'] as String,
      title: data['title'] as String,
    );
  }
}
