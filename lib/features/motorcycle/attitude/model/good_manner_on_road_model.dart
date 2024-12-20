class GoodMannersModel {
  final List<String> answer;
  final String correct;
  final String info;
  final String question;
  final String selfReflection;
  final String subtitle;
  final String subtitle1;
  final String title;

  GoodMannersModel({
    required this.answer,
    required this.correct,
    required this.info,
    required this.question,
    required this.selfReflection,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  factory GoodMannersModel.fromFirestore(Map<String, dynamic> data) {
    return GoodMannersModel(
      answer: List<String>.from(data['answer'] as List),
      correct: data['correct'] as String,
      info: data['info'] as String,
      question: data['question'] as String,
      selfReflection: data['self_reflection'] as String,
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      title: data['title'] as String,
    );
  }
}
