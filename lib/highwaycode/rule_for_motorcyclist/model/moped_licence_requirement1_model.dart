import 'package:cloud_firestore/cloud_firestore.dart';

class MopedLicenseRequirements {
  String? text;
  List<String>? points;

  MopedLicenseRequirements({this.text, this.points});

  // Factory method to create an object from Firestore document
  factory MopedLicenseRequirements.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return MopedLicenseRequirements(
      text: data['text'] ?? '',
      points: List<String>.from(data['points'] ?? []),
    );
  }

  // To convert the model to a map to save it to Firestore
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'points': points,
    };
  }
}
