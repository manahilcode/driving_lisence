// Model for parsing the data
class SignalInfo {
  final List<String> answers;
  final String correct;
  final String image;
  final List<ImageInfo> image1;
  final List<ImageInfo> image2;
  final String info;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  SignalInfo({
    required this.answers,
    required this.correct,
    required this.image,
    required this.image1,
    required this.image2,
    required this.info,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  factory SignalInfo.fromJson(Map<String, dynamic> json) {
    return SignalInfo(
      answers: List<String>.from(json['answers']),
      correct: json['correct'] ?? '',
      image: json['image'] ?? '',
      image1: (json['image1'] as List).map((item) => ImageInfo.fromJson(item)).toList(),
      image2: (json['image2'] as List).map((item) => ImageInfo.fromJson(item)).toList(),
      info: json['info'] ?? '',
      question: json['question'] ?? '',
      subtitle: json['subtitle'] ?? '',
      subtitle1: json['subtitle1'] ?? '',
      tip: json['tip'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers,
      'correct': correct,
      'image': image,
      'image1': image1.map((item) => item.toJson()).toList(),
      'image2': image2.map((item) => item.toJson()).toList(),
      'info': info,
      'question': question,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'tip': tip,
      'title': title,
    };
  }
}

class ImageInfo {
  final String text;
  final String url;

  ImageInfo({required this.text, required this.url});

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      text: json['0'] ?? '',
      url: json['1'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '0': text,
      '1': url,
    };
  }
}