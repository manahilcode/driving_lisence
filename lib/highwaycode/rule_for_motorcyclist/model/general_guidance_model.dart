import 'package:cloud_firestore/cloud_firestore.dart';

class HighwayCodeGeneralGuidance {
  String? text1;
  String? text2;
  String? text3;
  List<String>? text4;
  List<String>? text5;
  List<String>? text6;

  HighwayCodeGeneralGuidance({
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
  });

  // Factory method to create object from Firestore document
  factory HighwayCodeGeneralGuidance.fromFirestore(
      DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return HighwayCodeGeneralGuidance(
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
      text3: data['text3'] ?? '',
      text4: List<String>.from(data['text4'] ?? []),
      text5: List<String>.from(data['text5'] ?? []),
      text6: List<String>.from(data['text6'] ?? []),
    );
  }

  // To convert the model to a map to save it to Firestore
  Map<String, dynamic> toMap() {
    return {
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
      'text6': text6,
    };
  }
}
