class MotorcycleAnswerModel {
  final List<String> answer;
  final List<String> answer2;
  final String correct;
  final String correct2;
  final String correct3;
  final List<String> points;
  final String question;
  final String question2;
  final String question3;
  final String subtitle;
  final String subtitle1;
  final List<String> subtitle2;
  final List<String> subtitle3;
  final String subtitle4;
  final String subtitle5;
  final List<String> tip;
  final String title;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String title5;

  MotorcycleAnswerModel({
    required this.answer,
    required this.answer2,
    required this.correct,
    required this.correct2,
    required this.correct3,
    required this.points,
    required this.question,
    required this.question2,
    required this.question3,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.subtitle5,
    required this.tip,
    required this.title,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
  });

  factory MotorcycleAnswerModel.fromJson(Map<String, dynamic> json) {
    return MotorcycleAnswerModel(
      answer: List<String>.from(json['answer']),
      answer2: List<String>.from(json['answer2']),
      correct: json['correct'],
      correct2: json['correct2'],
      correct3: json['correct3'],
      points: List<String>.from(json['points']),
      question: json['question'],
      question2: json['question2'],
      question3: json['question3'],
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      subtitle2: List<String>.from(json['subtitle2']),
      subtitle3: List<String>.from(json['subtitle3']),
      subtitle4: json['subtitle4'],
      subtitle5: json['subtitle5'],
      tip: List<String>.from(json['tip']),
      title: json['title'],
      title1: json['title1'],
      title2: json['title2'],
      title3: json['title3'],
      title4: json['title4'],
      title5: json['title5'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'answer2': answer2,
      'correct': correct,
      'correct2': correct2,
      'correct3': correct3,
      'points': points,
      'question': question,
      'question2': question2,
      'question3': question3,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'subtitle5': subtitle5,
      'tip': tip,
      'title': title,
      'title1': title1,
      'title2': title2,
      'title3': title3,
      'title4': title4,
      'title5': title5,
    };
  }
}
