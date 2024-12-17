class FactorEffectingModel {
  final List<String> answer;
  final String correct;
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final String question;
  final String subtitle;
  final String title;
  final String info;

  FactorEffectingModel({
    required this.answer,
    required this.correct,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.question,
    required this.subtitle,
    required this.title,
    required this.info
  });

  factory FactorEffectingModel.fromJson(Map<String, dynamic> json) {
    return FactorEffectingModel(
      answer: List<String>.from(json['answer']),
      correct: json['correct'],
      image: json['image'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      question: json['question'],
      subtitle: json['subtitle'],
      title: json['title'],
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'correct': correct,
      'image': image,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'question': question,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
