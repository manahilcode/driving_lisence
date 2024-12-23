// SpeedLimitsModel
class SpeedLimitsModel {
  final List<String> answers;
  final String correctAnswer;
  final List<ImageInfo> images;
  final List<ImageInfo> image2;
  final List<ImageInfo> image3;
  final String info;
  final List<String> points;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String subtitle3;
  final String tip;
  final String tip1;
  final String tip2;
  final String tip3;
  final String title;

  SpeedLimitsModel({
    required this.answers,
    required this.correctAnswer,
    required this.images,
    required this.image2,
    required this.image3,
    required this.info,
    required this.points,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle3,
    required this.tip,
    required this.tip1,
    required this.tip2,
    required this.tip3,
    required this.title,
  });

  factory SpeedLimitsModel.fromJson(Map<String, dynamic> json) {
    return SpeedLimitsModel(
      answers: List<String>.from(json['answers'] ?? []),
      correctAnswer: json['correct'] ?? '',
      images: (json['image'] as List<dynamic>?)
          ?.map((item) => ImageInfo.fromJson(item))
          .toList() ??
          [],
      image2: (json['image2'] as List<dynamic>?)
          ?.map((item) => ImageInfo.fromJson(item))
          .toList() ??
          [],
      image3: (json['image3'] as List<dynamic>?)
          ?.map((item) => ImageInfo.fromJson(item))
          .toList() ??
          [],
      info: json['info'] ?? '',
      points: List<String>.from(json['points'] ?? []),
      question: json['question'] ?? '',
      subtitle: json['subtitle'] ?? '',
      subtitle1: json['subtitle1'] ?? '',
      subtitle3: json['subtitle3'] ?? '',
      tip: json['tip'] ?? '',
      tip1: json['tip1'] ?? '',
      tip2: json['tip2'] ?? '',
      tip3: json['tip3'] ?? '',
      title: json['title'] ?? '',
    );
  }
}

class ImageInfo {
  final String description;
  final String url;

  ImageInfo({required this.description, required this.url});

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      description: json["0"] ?? '',
      url: json["1"] ?? '',
    );
  }
}


