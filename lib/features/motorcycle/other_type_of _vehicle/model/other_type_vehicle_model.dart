import 'package:cloud_firestore/cloud_firestore.dart';

class OtherVehicleInfo1 {
  final String image;
  final List<String> points;
  final String title;

  OtherVehicleInfo1({
    required this.image,
    required this.points,
    required this.title,
  });

  factory OtherVehicleInfo1.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return OtherVehicleInfo1(
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
