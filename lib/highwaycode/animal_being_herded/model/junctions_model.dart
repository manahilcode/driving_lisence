import 'package:cloud_firestore/cloud_firestore.dart';

// Model Class
class Junction {
  final String header;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;
  final String text9;

  Junction({
    required this.header,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
  });

  factory Junction.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Junction(
      header: data['header'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
      text3: data['text3'] ?? '',
      text4: data['text4'] ?? '',
      text5: data['text5'] ?? '',
      text6: data['text6'] ?? '',
      text7: data['text7'] ?? '',
      text8: data['text8'] ?? '',
      text9: data['text9'] ?? '',
    );
  }
}




