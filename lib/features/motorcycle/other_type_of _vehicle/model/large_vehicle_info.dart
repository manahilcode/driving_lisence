import 'package:cloud_firestore/cloud_firestore.dart';

class LargeVehicleInfo {
  final List<String> answer;
  final String correct;
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String info;
  final List<String> points;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String tip;
  final String title;

  LargeVehicleInfo({
    required this.answer,
    required this.correct,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.info,
    required this.points,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  // Factory constructor to create an instance from Firestore document
  factory LargeVehicleInfo.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return LargeVehicleInfo(
      answer: List<String>.from(data['answer'] ?? []),
      correct: data['correct'] ?? '',
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      image4: data['image4'] ?? '',
      info: data['info'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      question: data['question'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }

  // Method to convert the instance to a map (useful for uploading to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'correct': correct,
      'image': image,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'info': info,
      'points': points,
      'question': question,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'tip': tip,
      'title': title,
    };
  }
}
