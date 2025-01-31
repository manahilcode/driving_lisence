import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Model Class
class OverviewModel {
  final String header;
  final List<String> points;
  final List<String> points1;
  final List<String> points3;
  final List<String> text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;
  final List<String> text6;

  OverviewModel({
    required this.header,
    required this.points,
    required this.points1,
    required this.points3,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
  });

  factory OverviewModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OverviewModel(
      header: data['header'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      points3: List<String>.from(data['points3'] ?? []),
      text: List<String>.from(data['text'] ?? []),
      text1: List<String>.from(data['text1'] ?? []),
      text2: List<String>.from(data['text2'] ?? []),
      text3: List<String>.from(data['text3'] ?? []),
      text4: List<String>.from(data['text4'] ?? []),
      text5: List<String>.from(data['text5'] ?? []),
      text6: List<String>.from(data['text6'] ?? []),
    );
  }
}




