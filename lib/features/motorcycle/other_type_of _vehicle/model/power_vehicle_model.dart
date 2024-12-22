import 'package:cloud_firestore/cloud_firestore.dart';

class PoweredVehicleInfo {
  final String subtitle;
  final String title;

  PoweredVehicleInfo({
    required this.subtitle,
    required this.title,
  });

  factory PoweredVehicleInfo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return PoweredVehicleInfo(
      subtitle: data['subtitle'] ?? '',
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subtitle': subtitle,
      'title': title,
    };
  }
}
