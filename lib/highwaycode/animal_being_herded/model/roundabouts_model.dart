import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Model Class
class RoundaboutsModel {
  final List<String> text;
  final List<String> text1;

  RoundaboutsModel({
    required this.text,
    required this.text1,
  });

  factory RoundaboutsModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RoundaboutsModel(
      text: List<String>.from(data['text'] ?? []),
      text1: List<String>.from(data['text1'] ?? []),
    );
  }
}



