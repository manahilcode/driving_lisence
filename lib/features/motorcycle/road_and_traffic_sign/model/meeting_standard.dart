import 'package:flutter/foundation.dart';

class MeetingStandardSign {
  final List<String> points;
  final String title;
  final String title1;
  final String title2;

  MeetingStandardSign({
    required this.points,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory MeetingStandardSign.fromJson(Map<String, dynamic> json) {
    return MeetingStandardSign(
      points: List<String>.from(json['points']),
      title: json['title'] ?? '',
      title1: json['title1'] ?? '',
      title2: json['title2'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
