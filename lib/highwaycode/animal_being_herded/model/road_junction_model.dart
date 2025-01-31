// Model Class
import 'package:cloud_firestore/cloud_firestore.dart';

class RoadJunctionModel {
  final List<String> points;

  RoadJunctionModel({required this.points});

  factory RoadJunctionModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RoadJunctionModel(
      points: List<String>.from(data['points'] ?? []),
    );
  }
}
