class EssentialDocumentsDetails {
  final List<String> answer;
  final String correct;
  final String info;
  final List<String> points;
  final String question;
  final String tip;
  final String title;

  EssentialDocumentsDetails({
    required this.answer,
    required this.correct,
    required this.info,
    required this.points,
    required this.question,
    required this.tip,
    required this.title,
  });

  factory EssentialDocumentsDetails.fromJson(Map<String, dynamic> json) {
    return EssentialDocumentsDetails(
      answer: List<String>.from(json['answer'] as List),
      correct: json['correct'] as String,
      info: json['info'] as String,
      points: List<String>.from(json['points'] as List),
      question: json['question'] as String,
      tip: json['tip'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'correct': correct,
      'info': info,
      'points': points,
      'question': question,
      'tip': tip,
      'title': title,
    };
  }
}
