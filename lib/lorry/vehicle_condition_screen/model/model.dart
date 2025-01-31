class LorryModel {
  List<String?> answer;
  String? correct;
  String? doc;
  String? info;
  String? question;

  LorryModel({
    required this.answer,
    required this.correct,
    required this.doc,
    required this.info,
    required this.question,
  });

  factory LorryModel.fromJson(Map<String, dynamic> json) {
    return LorryModel(
      answer: List<String?>.from(json['answer'] ?? []),
      correct: json['correct'] as String?,
      doc: json['doc'] as String?,
      info: json['info'] as String?,
      question: json['question'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'correct': correct,
      'doc': doc,
      'info': info,
      'question': question,
    };
  }
}
