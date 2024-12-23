class TunnelSafetyModel {
  final String image;
  final String info;
  final List<String> points;
  final List<String> points1;
  final String question;
  final List<String> answer;
  final String correct;
  final String title;

  TunnelSafetyModel({
    required this.image,
    required this.info,
    required this.points,
    required this.points1,
    required this.question,
    required this.answer,
    required this.correct,
    required this.title,
  });

  // Factory method to create TunnelSafetyModel from a JSON-like map
  factory TunnelSafetyModel.fromMap(Map<String, dynamic> map) {
    return TunnelSafetyModel(
      image: map['image'] as String,
      info: map['info'] as String,
      points: List<String>.from(map['points'] ?? []),
      points1: List<String>.from(map['points1'] ?? []),
      question: map['question'] as String,
      answer: List<String>.from(map['answer'] ?? []),
      correct: map['correct'] as String,
      title: map['title'] as String,
    );
  }

  // Convert TunnelSafetyModel to a JSON-like map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'info': info,
      'points': points,
      'points1': points1,
      'question': question,
      'answer': answer,
      'correct': correct,
      'title': title,
    };
  }
}
