class SpeedLimitModel {
  final List<String> answer;
  final String correct;
  final String info;
  final List<String> points;
  final String question;
  final String tip;
  final String title;

  SpeedLimitModel({
    required this.answer,
    required this.correct,
    required this.info,
    required this.points,
    required this.question,
    required this.tip,
    required this.title,
  });

  // Factory constructor to create the model from Firestore data
  factory SpeedLimitModel.fromMap(Map<String, dynamic> map) {
    return SpeedLimitModel(
      answer: List<String>.from(map['answer']),
      correct: map['correct'],
      info: map['info'],
      points: List<String>.from(map['points']),
      question: map['question'],
      tip: map['tip'],
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
      'question': question,
      'tip': tip,
      'title': title,
    };
  }
}
