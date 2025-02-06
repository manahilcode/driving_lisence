import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Model Class
class OverviewModel {
  final List<String>? points;
  final List<String>? points1;
  final List<String>? points3;
  final String? text;
  final List<String>? text1;
  final List<String>? text2;
  final List<String>? text3;
  final List<String>? text4;
  final List<String>? text5;
  final List<String>? text6;

  OverviewModel({
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

  factory OverviewModel.fromFirestore(DocumentSnapshot<Object?> doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return OverviewModel(
      points: data?['points']?.cast<String>() ?? [],
      points1: data?['points1']?.cast<String>() ?? [],
      points3: data?['points3']?.cast<String>() ?? [],
      text: data?['text']  ?? "",
      text1: data?['text1']?.cast<String>() ?? [],
      text2: data?['text2']?.cast<String>() ?? [],
      text3: data?['text3']?.cast<String>() ?? [],
      text4: data?['text4']?.cast<String>() ?? [],
      text5: data?['text5']?.cast<String>() ?? [],
      text6: data?['text6']?.cast<String>() ?? [],
    );
  }
}