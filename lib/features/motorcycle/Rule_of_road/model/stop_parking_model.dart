import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// StoppingAndParkingModel
class StoppingAndParkingModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String tip;
  final String title;

  StoppingAndParkingModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  factory StoppingAndParkingModel.fromJson(Map<String, dynamic> json) {
    return StoppingAndParkingModel(
      image: json['image'] ?? '',
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] ?? '',
      subtitle1: json['subtitle1'] ?? '',
      subtitle2: json['subtitle2'] ?? '',
      tip: json['tip'] ?? '',
      title: json['title'] ?? '',
    );
  }
}