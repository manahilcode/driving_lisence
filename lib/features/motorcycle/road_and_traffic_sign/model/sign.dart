import 'package:flutter/foundation.dart';

class SignSign {
  final List<String> answer;
  final String correct;
  final String image;
  final List<dynamic> image1; // Contains both strings and image URLs
  final List<dynamic> image2; // Contains both strings and image URLs
  final String info;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  SignSign({
    required this.answer,
    required this.correct,
    required this.image,
    required this.image1,
    required this.image2,
    required this.info,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  factory SignSign.fromJson(Map<String, dynamic> json) {
    return SignSign(
      answer: List<String>.from(json['answer']),
      correct: json['correct'],
      image: json['image'],
      image1: json['image1'],
      image2: json['image2'],
      info: json['info'],
      question: json['question'],
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      tip: json['tip'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'correct': correct,
      'image': image,
      'image1': image1,
      'image2': image2,
      'info': info,
      'question': question,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'tip': tip,
      'title': title,
    };
  }
}