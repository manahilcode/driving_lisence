class TowingTrailerModel {
  final List<String> answer;
  final String correct;
  final String image;
  final String info;
  final List<String> points;
  final String question;
  final String title;

  TowingTrailerModel({
    required this.answer,
    required this.correct,
    required this.image,
    required this.info,
    required this.points,
    required this.question,
    required this.title,
  });

  // Factory method to create TowingTrailerModel from a map
  factory TowingTrailerModel.fromMap(Map<String, dynamic> map) {
    return TowingTrailerModel(
      answer: List<String>.from(map['answer'] ?? []),
      correct: map['correct'] as String,
      image: map['image'] as String,
      info: map['info'] as String,
      points: List<String>.from(map['points'] ?? []),
      question: map['question'] as String,
      title: map['title'] as String,
    );
  }

  // Convert TowingTrailerModel to a map
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'correct': correct,
      'image': image,
      'info': info,
      'points': points,
      'question': question,
      'title': title,
    };
  }
}
