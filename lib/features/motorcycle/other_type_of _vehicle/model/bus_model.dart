import 'package:cloud_firestore/cloud_firestore.dart';

class BusAndTramInfo {
  final String image;
  final String image1;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;
  final String title1;

  BusAndTramInfo({
    required this.image,
    required this.image1,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
    required this.title1,
  });

  // Factory constructor to create an instance from Firestore document
  factory BusAndTramInfo.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return BusAndTramInfo(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
    );
  }
}
