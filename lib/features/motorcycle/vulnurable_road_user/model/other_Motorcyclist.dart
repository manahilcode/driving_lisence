import 'package:cloud_firestore/cloud_firestore.dart';

class OtherMotorcyclists {
  final String image;
  final String image1;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String tip1;
  final String title;

  OtherMotorcyclists({
    required this.image,
    required this.image1,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.tip1,
    required this.title,
  });

  // Factory constructor to convert Firestore data to model
  factory OtherMotorcyclists.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return OtherMotorcyclists(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      tip: data['tip'] ?? '',
      tip1: data['tip1'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
