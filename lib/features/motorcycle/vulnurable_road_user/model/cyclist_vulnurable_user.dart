import 'package:cloud_firestore/cloud_firestore.dart';

class Cyclist {
  final String image;
  final String image1;
  final String image2;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String title;
  final String title1;
  final String title2;
  final String title3;

  Cyclist({
    required this.image,
    required this.image1,
    required this.image2,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  // Factory constructor to convert Firestore data to model
  factory Cyclist.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Cyclist(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
      title3: data['title3'] ?? '',
    );
  }
}
