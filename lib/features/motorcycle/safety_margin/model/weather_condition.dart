class ImageModel {
  final String image;
  final String text;

  ImageModel({
    required this.image,
    required this.text,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      image: json['image'] ?? '',
      text: json['text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'text': text,
    };
  }
}
class WeatherConditionModel {
  final String ford;
  final ImageModel image;
  final ImageModel image1;
  final ImageModel image2;
  final ImageModel image3;
  final ImageModel image4;
  final ImageModel image5;
  final String reflection;
  final String subtitle;
  final String tip;
  final String title;

  WeatherConditionModel({
    required this.ford,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.reflection,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    return WeatherConditionModel(
      ford: json['ford'] ?? '',
      image: ImageModel.fromJson(json['image'] ?? {}),
      image1: ImageModel.fromJson(json['image1'] ?? {}),
      image2: ImageModel.fromJson(json['image2'] ?? {}),
      image3: ImageModel.fromJson(json['image3'] ?? {}),
      image4: ImageModel.fromJson(json['image4'] ?? {}),
      image5: ImageModel.fromJson(json['image5'] ?? {}),
      reflection: json['reflection'] ?? '',
      subtitle: json['subtitle'] ?? '',
      tip: json['tip'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ford': ford,
      'image1': image1.toJson(),
      'image2': image2.toJson(),
      'image3': image3.toJson(),
      'image4': image4.toJson(),
      'image5': image5.toJson(),
      'reflection': reflection,
      'subtitle': subtitle,
      'tip': tip,
      'title': title,
    };
  }
}
