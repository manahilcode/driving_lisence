class StoppingBreakdownModel {
  final List<String> answer;
  final String correct;
  final String info;
  final List<String> points;
  final List<String> points1;
  final String question;
  final String subtitle;
  final String title;

  StoppingBreakdownModel({
    required this.answer,
    required this.correct,
    required this.info,
    required this.points,
    required this.points1,
    required this.question,
    required this.subtitle,
    required this.title,
  });

  // Factory constructor to create the model from Firestore data
  factory StoppingBreakdownModel.fromMap(Map<String, dynamic> map) {
    return StoppingBreakdownModel(
      answer: List<String>.from(map['answer']),
      correct: map['correct'],
      info: map['info'],
      points: List<String>.from(map['points']),
      points1: List<String>.from(map['points1']),
      question: map['question'],
      subtitle: map['subtitle'],
      title: map['title'],
    );
  }

  // Method to convert the model into a map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'correct': correct,
      'info': info,
      'points': points,
      'points1': points1,
      'question': question,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
