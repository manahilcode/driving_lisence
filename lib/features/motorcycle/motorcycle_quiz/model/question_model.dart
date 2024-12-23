class MotorcycleQuestionModel {
  final List<String> answer;
  final String correct;
  final String doc;
  final String info;
  final String question;

  MotorcycleQuestionModel({
    required this.answer,
    required this.correct,
    required this.doc,
    required this.info,
    required this.question,
  });

  // Factory method to create CrossingTypeModel from a map
  factory MotorcycleQuestionModel.fromMap(Map<String, dynamic> map) {
    return MotorcycleQuestionModel(
      answer: List<String>.from(map['answer'] ?? []),
      correct: map['correct'] as String,
      doc: map['doc'] as String,
      info: map['info'] as String,
      question: map['question'] as String,
    );
  }

  // Convert CrossingTypeModel to a map
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'correct': correct,
      'doc': doc,
      'info': info,
      'question': question,
    };
  }
}
