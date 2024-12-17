class MotorcycleRoadWeatherConditions {
  final List<String> answer;
  final String correct;
  final List<String> points;
  final List<String> points1;
  final List<String> points2;
  final List<String> points3;
  final Question question;
  final String subtitle;
  final String subtitle1;
  final String title;
  final String info;

  MotorcycleRoadWeatherConditions({

    required this.answer,
    required this.correct,
    required this.points,
    required this.points1,
    required this.points2,
    required this.points3,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
    required this.info,
  });

  // Convert a MotorcycleRoadWeatherConditions instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'correct': correct,
      'points': points,
      'points1': points1,
      'points2': points2,
      'points3': points3,
      'question': question.toMap(),
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
    };
  }

  // Create a MotorcycleRoadWeatherConditions instance from a Map
  factory MotorcycleRoadWeatherConditions.fromMap(Map<String, dynamic> map) {
    return MotorcycleRoadWeatherConditions(

      answer: List<String>.from(map['answer']),
      correct: map['correct'],
      points: List<String>.from(map['points']),
      points1: List<String>.from(map['points1']),
      points2: List<String>.from(map['points2']),
      points3: List<String>.from(map['points3']),
      question: Question.fromMap(map['question']),
      subtitle: map['subtitle'],
      subtitle1: map['subtitle1'],
      title: map['title'],
      info: map['info'],
    );
  }

  // Create a MotorcycleRoadWeatherConditions instance from JSON
  factory MotorcycleRoadWeatherConditions.fromJson(Map<String, dynamic> json) {
    return MotorcycleRoadWeatherConditions.fromMap(json);
  }
}

class Question {
  final String image;
  final String text;

  Question({
    required this.image,
    required this.text,
  });

  // Convert a Question instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'text': text,
    };
  }

  // Create a Question instance from a Map
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      image: map['image'],
      text: map['text'],
    );
  }
}