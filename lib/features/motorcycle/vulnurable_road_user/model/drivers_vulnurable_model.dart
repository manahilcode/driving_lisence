import 'package:cloud_firestore/cloud_firestore.dart';

class Driver {
  final String image;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  Driver({
    required this.image,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  // Factory constructor to convert Firestore data to model
  factory Driver.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Driver(
      image: data['image'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
