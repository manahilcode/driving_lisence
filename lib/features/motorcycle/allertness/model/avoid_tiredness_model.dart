class AvoidingTirednessModel {
  final String question;
  final String selfReflection;
  final String subtitle;
  final String info;
  final String tip;
  final String correct;
  final List<String> answer;
  final List<String> points;

  AvoidingTirednessModel({
    required this.question,
    required this.selfReflection,
    required this.subtitle,
    required this.info,
    required this.tip,
    required this.correct,
    required this.answer,
    required this.points,
  });

  factory AvoidingTirednessModel.fromFirestore(Map<String, dynamic> data) {
    return AvoidingTirednessModel(
      question: data['question'] as String,
      selfReflection: data['self_reflection'] as String,
      subtitle: data['subtitle'] as String,
      info: data['info'] as String,
      tip: data['tip'] as String,
      correct: data['correct'] as String,
      answer: List<String>.from(data['answer']),
      points: List<String>.from(data['points']),
    );
  }
}
