import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalVulnerableUser {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;

  AnimalVulnerableUser({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  // Factory constructor to convert Firestore data to model
  factory AnimalVulnerableUser.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return AnimalVulnerableUser(
      image: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
