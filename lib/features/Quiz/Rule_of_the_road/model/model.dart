class QuizModel {
  final List<String> answers;
  final String correct;
  final String doc;
  final String info;
  final String question;

  QuizModel({
    required this.answers,
    required this.correct,
    required this.doc,
    required this.info,
    required this.question,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      answers: List<String>.from(json['answer'] as List<dynamic>),
      correct: json['correct'] as String,
      doc: json['doc'] as String,
      info: json['info'] as String,
      question: json['question'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answers,
      'correct': correct,
      'doc': doc,
      'info': info,
      'question': question,
    };
  }
}
