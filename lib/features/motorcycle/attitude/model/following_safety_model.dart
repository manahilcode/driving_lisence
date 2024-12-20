class FollowingSafelyModel {
  final List<String> answer;
  final String correct;
  final String image;
  final String info;
  final List<String> points;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String tip;
  final String title;

  FollowingSafelyModel({
    required this.answer,
    required this.correct,
    required this.image,
    required this.info,
    required this.points,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.tip,
    required this.title,
  });

  factory FollowingSafelyModel.fromFirestore(Map<String, dynamic> data) {
    return FollowingSafelyModel(
      answer: List<String>.from(data['answer'] as List),
      correct: data['correct'] as String,
      image: data['image'] as String,
      info: data['info'] as String,
      points: List<String>.from(data['points'] as List),
      question: data['question'] as String,
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      subtitle2: data['subtitle2'] as String,
      subtitle3: data['subtitle3'] as String,
      tip: data['tip'] as String,
      title: data['title'] as String,
    );
  }
}
