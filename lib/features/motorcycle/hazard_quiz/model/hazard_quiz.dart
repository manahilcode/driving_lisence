class HazardQuiz {
  final String question;
  final List<String> answer;
  final String correct;
  final String doc;
  final String info;
  final String video;

  HazardQuiz({
    required this.question,
    required this.answer,
    required this.correct,
    required this.doc,
    required this.info,
    required this.video,
  });

  // Convert to a map for easy JSON serialization, ensuring null values are handled
  Map<String, dynamic> toMap() {
    return {
      'question': question.isNotEmpty ? question : '', // Handle null or empty string
      'answer': answer.isNotEmpty ? answer : [], // Handle null or empty list
      'correct': correct.isNotEmpty ? correct : '', // Handle null or empty string
      'doc': doc.isNotEmpty ? doc : '', // Handle null or empty string
      'info': info.isNotEmpty ? info : '', // Handle null or empty string
      'video': video.isNotEmpty ? video : '', // Handle null or empty string
    };
  }

  // Convert from a map to the object (for deserialization), ensuring default values are used if null
  factory HazardQuiz.fromMap(Map<String, dynamic> map) {
    return HazardQuiz(
      question: map['question'] ?? '', // Default to empty string if null
      answer: map['answer'] != null ? List<String>.from(map['answer']) : [], // Default to empty list if null
      correct: map['correct'] ?? '', // Default to empty string if null
      doc: map['doc'] ?? '', // Default to empty string if null
      info: map['info'] ?? '', // Default to empty string if null
      video: map['video'] ?? '', // Default to empty string if null
    );
  }
}
