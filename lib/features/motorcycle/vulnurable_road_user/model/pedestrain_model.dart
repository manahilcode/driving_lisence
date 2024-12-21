import 'package:cloud_firestore/cloud_firestore.dart';

class PedestrianVal {
  final String image;
  final String image1;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  PedestrianVal({
    required this.image,
    required this.image1,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  // Factory constructor to convert Firestore data to model
  factory PedestrianVal.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return PedestrianVal(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
