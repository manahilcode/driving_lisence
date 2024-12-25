import 'package:flutter/foundation.dart';

class SignSign {
  final List<String> image;
  final List<String> image1; // Contains both strings and image URLs
  final List<String> image2;
  final List<String> image3;
  final List<String> image4;
  final List<String> image5;
  final List<String> image6;
  final List<String> image7;
  final String subtitle;
  final String title;

  SignSign({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.image7,
    required this.subtitle,
    required this.title,
  });

  factory SignSign.fromJson(Map<String, dynamic> json) {
    return SignSign(
      image: json['image'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      image4: json['image4'],
      image5: json['image5'],
      image6: json['image6'],
      image7: json['image7'],
      subtitle: json['subtitle'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'subtitle': subtitle,
      'title': title,
    };
  }
}