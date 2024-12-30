class FactorEffectingModel {
  final List<String> answer;
  final String correct;
  final String? image; // Nullable field
  final String? image1; // Nullable field
  final String? image2; // Nullable field
  final String? image3; // Nullable field
  final String? question; // Nullable field
  final String? subtitle; // Nullable field
  final String title; // Non-nullable field
  final String info; // Non-nullable field

  FactorEffectingModel({
    required this.answer,
    required this.correct,
    this.image, // Optional field
    this.image1, // Optional field
    this.image2, // Optional field
    this.image3, // Optional field
    this.question, // Optional field
    this.subtitle, // Optional field
    required this.title, // Non-nullable field
    required this.info, // Non-nullable field
  });

  factory FactorEffectingModel.fromJson(Map<String, dynamic> json) {
    return FactorEffectingModel(
      answer: json['answer'] != null ? List<String>.from(json['answer']) : [],
      correct: json['correct'] ?? '', // Default to empty string if null
      image: json['image'], // Can be null
      image1: json['image1'], // Can be null
      image2: json['image2'], // Can be null
      image3: json['image3'], // Can be null
      question: json['question'], // Can be null
      subtitle: json['subtitle'], // Can be null
      title: json['title'] ?? '', // Default to empty string if null
      info: json['info'] ?? '', // Default to empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'correct': correct,
      'image': image, // Can be null
      'image1': image1, // Can be null
      'image2': image2, // Can be null
      'image3': image3, // Can be null
      'question': question, // Can be null
      'subtitle': subtitle, // Can be null
      'title': title,
      'info': info,
    };
  }
}
