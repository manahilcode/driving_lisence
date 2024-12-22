import 'package:cloud_firestore/cloud_firestore.dart';

class MotorcycleHandling {
  final String image;
  final List<String> points;
  final String title;

  MotorcycleHandling({
    required this.image,
    required this.points,
    required this.title,
  });

  factory MotorcycleHandling.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MotorcycleHandling(
      image: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
