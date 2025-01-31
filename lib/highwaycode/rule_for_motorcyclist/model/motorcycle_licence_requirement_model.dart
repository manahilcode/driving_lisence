import 'package:cloud_firestore/cloud_firestore.dart';

class MotorcycleLicenceRequirements33 {
  String? text;
  String? text1;
  String? text2;
  String? text3;
  List<String>? points;

  MotorcycleLicenceRequirements33({
    this.text,
    this.text1,
    this.text2,
    this.text3,
    this.points,
  });

  // Factory method to create an object from Firestore document
  factory MotorcycleLicenceRequirements33.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return MotorcycleLicenceRequirements33(
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
      text3: data['text3'] ?? '',
      points: List<String>.from(data['points'] ?? []),
    );
  }

  // To convert the model to a map to save it to Firestore
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'points': points,
    };
  }
}
