import 'package:cloud_firestore/cloud_firestore.dart';

class MotorcycleLicenceRequirements22 {
  String? text;
  List<String>? text1;
  List<String>? text2;
  List<String>? text3;
  List<String>? text4;

  MotorcycleLicenceRequirements22({
    this.text,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
  });

  // Factory method to create an object from Firestore document
  factory MotorcycleLicenceRequirements22.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return MotorcycleLicenceRequirements22(
      text: data['text'] ?? '',
      text1: List<String>.from(data['text1'] ?? []),
      text2: List<String>.from(data['text2'] ?? []),
      text3: List<String>.from(data['text3'] ?? []),
      text4: List<String>.from(data['text4'] ?? []),
    );
  }

  // To convert the model to a map to save it to Firestore
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
    };
  }
}
