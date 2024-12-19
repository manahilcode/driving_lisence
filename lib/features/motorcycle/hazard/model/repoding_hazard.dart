class RespondingToHazards {
  final String title;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String tip;
  final String question;
  final String question1;
  final List<String> answer;
  final List<String> answer2;
  final String correct;
  final String correct1;
  final List<String> points;
  final String video;
  final String video1;
  final String video2;
  final String info;
  final String info1;

  RespondingToHazards({
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.tip,
    required this.question,
    required this.question1,
    required this.answer,
    required this.answer2,
    required this.correct,
    required this.correct1,
    required this.points,
    required this.video,
    required this.video1,
    required this.video2,
    required this.info,
    required this.info1,
  });

  // Convert to a map for easy JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'tip': tip,
      'question': question,
      'question1': question1,
      'answer': answer,
      'answer2': answer2,
      'correct': correct,
      'correct1': correct1,
      'points': points,
      'video': video,
      'video1': video1,
      'video2': video2,
    };
  }

  // Convert from a map to the object (for deserialization)
  factory RespondingToHazards.fromMap(Map<String, dynamic> map) {
    return RespondingToHazards(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      subtitle1: map['subtitle1'] ?? '',
      subtitle2: map['subtitle2'] ?? '',
      tip: map['tip'] ?? '',
      question: map['question'] ?? '',
      question1: map['question1'] ?? '',
      answer: List<String>.from(map['answer'] ?? []),
      answer2: List<String>.from(map['answer2'] ?? []),
      correct: map['correct'] ?? '',
      correct1: map['correct1'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      video: map['video'] ?? '',
      video1: map['video1'] ?? '',
      video2: map['video2'] ?? '',
      info: map['info'] ?? '',
      info1: map['info1'] ?? '',
    );
  }
}
