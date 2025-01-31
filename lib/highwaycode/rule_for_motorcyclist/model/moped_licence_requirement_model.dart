import 'package:cloud_firestore/cloud_firestore.dart';

class MopedLicenceRequirements11 {
  String? text;

  MopedLicenceRequirements11({this.text});

  // Factory method to create an object from Firestore document
  factory MopedLicenceRequirements11.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return MopedLicenceRequirements11(
      text: data['text'] ?? '',
    );
  }

  // To convert the model to a map to save it to Firestore
  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
