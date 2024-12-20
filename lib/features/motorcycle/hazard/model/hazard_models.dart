class MotorcycleHazard {
  final String image;
  final String subtitle;
  final String title;

  MotorcycleHazard({
    required this.image,
    required this.subtitle,
    required this.title,
  });
}

class MotorcycleStaticHazard {
  final List<String> answer;
  final List<String> answer1;
  final List<String> answer2;
  final String correct1;
  final String correct2;
  final List<ImageMap> images;
  final Question question2;
  final Question question;
  final Question question1;
  final String subtitle;
  final String title;
  final String info1;
  final String info2;


  MotorcycleStaticHazard({
    required this.answer,
    required this.answer1,
    required this.answer2,
    required this.correct1,
    required this.correct2,
    required this.images,
    required this.question2,
    required this.question,
    required this.question1,
    required this.subtitle,
    required this.title,
    required this.info1,
    required this.info2
  });

  // Convert a MotorcycleStaticHazard instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'answer1': answer1,
      'answer2': answer2,
      'correct1': correct1,
      'correct2': correct2,
      'images': images.map((imageMap) => imageMap.toMap()).toList(),
      'question2': question2.toMap(),
      'question': question.toMap(),
      'question1': question1.toMap(),
      'subtitle': subtitle,
      'title': title,
    };
  }

  // Create a MotorcycleStaticHazard instance from a Map
  factory MotorcycleStaticHazard.fromMap(Map<String, dynamic> map) {
    return MotorcycleStaticHazard(
      answer: List<String>.from(map['answer'] ?? []),
      answer1: List<String>.from(map['answer1'] ?? []),
      answer2: List<String>.from(map['answer2'] ?? []),
      correct1: map['correct1'] ?? '',
      correct2: map['correct2'] ?? '',
      images: (map['images'] as List<dynamic>?)
          ?.map((x) => ImageMap.fromMap(x as Map<String, dynamic>))
          .toList() ??
          [],
      question2: map['question2'] != null
          ? Question.fromMap(map['question2'] as Map<String, dynamic>)
          : Question(image: '', text: ''), // Default Question
      question: map['question'] != null
          ? Question.fromMap(map['question'] as Map<String, dynamic>)
          : Question(image: '', text: ''), // Default Question
      question1: map['question1'] != null
          ? Question.fromMap(map['question1'] as Map<String, dynamic>)
          : Question(image: '', text: ''), // Default Question
      subtitle: map['subtitle'] ?? '',
      title: map['title'] ?? '',
      info1: map['info1'] ?? '',
      info2: map['info2'] ?? '',
    );
  }
}

class ImageMap {
  final String image;
  final String name;

  ImageMap({
    required this.image,
    required this.name,
  });

  // Convert an ImageMap instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }

  // Create an ImageMap instance from a Map
  factory ImageMap.fromMap(Map<String, dynamic> map) {
    return ImageMap(
      image: map['image'],
      name: map['name'],
    );
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

