import 'package:cloud_firestore/cloud_firestore.dart';

// Model Class
class CrossingTheRoadModel {
  final List<String> points;
  final String text;
  final String text1;
  final String text2;
  final String text3;

  CrossingTheRoadModel({
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  factory CrossingTheRoadModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CrossingTheRoadModel(
      points: List<String>.from(data['points'] ?? []),
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
      text3: data['text3'] ?? '',
    );
  }
}




