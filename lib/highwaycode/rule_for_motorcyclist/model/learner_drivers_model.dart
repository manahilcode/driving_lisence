import 'package:cloud_firestore/cloud_firestore.dart';

class HighwayCodeLearnerDrivers {
  String? text;

  HighwayCodeLearnerDrivers({this.text});

  // Factory method to create an object from Firestore document
  factory HighwayCodeLearnerDrivers.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return HighwayCodeLearnerDrivers(
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
