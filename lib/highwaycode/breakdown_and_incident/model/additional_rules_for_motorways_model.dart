import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Model Class
class AdditionalRulesForMotorwaysModel {
  final String image;
  final String image1;
  final List<String> points;
  final List<String> points1;
  final String text;

  AdditionalRulesForMotorwaysModel({
    required this.image,
    required this.image1,
    required this.points,
    required this.points1,
    required this.text,
  });

  // Factory method to create a MotorwayGuide from Firestore data
  factory AdditionalRulesForMotorwaysModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AdditionalRulesForMotorwaysModel(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      text: data['text'] ?? '',
    );
  }
}



