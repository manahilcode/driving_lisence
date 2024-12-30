class QuizQuestion {
  List<String>? answer; // List of answers, nullable
  String? correct; // Correct answer as a string (nullable)
  String? doc; // Documentation ID or reference (nullable)
  String? info; // Additional information (nullable)
  String? question; // The question text (nullable)

  // Constructor
  QuizQuestion({
    this.answer,
    this.correct,
    this.doc,
    this.info,
    this.question,
  });

  // Factory method to create QuizQuestion from a Map (e.g., for parsing JSON)
  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      answer: json['answer'] != null ? List<String>.from(json['answer']) : null,
      correct: json['correct'],
      doc: json['doc'],
      info: json['info'],
      question: json['question'],
    );
  }

  // Method to convert QuizQuestion to a Map (e.g., for encoding to JSON)
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
