class QuizModel {
  final List<String> answers;
  final String correct;
  final String doc;
  final String info;
  final String question;
  final String? image;  // Make image nullable

  QuizModel({
    required this.answers,
    required this.correct,
    required this.doc,
    required this.info,
    required this.question,
    this.image,  // Allow null image
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      answers: List<String>.from(json['answer'] as List<dynamic>),
      correct: json['correct'] as String,
      doc: json['doc'] as String,
      info: json['info'] as String,
      question: json['question'] as String,
      image: json['image'] != null ? json['image'] as String : null, // Handle missing image key
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answers,
      'correct': correct,
      'doc': doc,
      'info': info,
      'question': question,
      // image is optional, so it will not be added if null
      if (image != null) 'image': image,
    };
  }
}
