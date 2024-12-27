class ImageModel {
  final String image;
  final String text;

  ImageModel({
    required this.image,
    required this.text,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      image: json['image'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'text': text,
    };
  }
}
class Security {
  final ImageModel image;
  final ImageModel image1;
  final ImageModel image2;
  final ImageModel image3;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String title;

  Security({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  factory Security.fromJson(Map<String, dynamic> json) {
    return Security(
      image: ImageModel.fromJson(json['image']),
      image1: ImageModel.fromJson(json['image1']),
      image2: ImageModel.fromJson(json['image2']),
      image3: ImageModel.fromJson(json['image3']),
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image.toJson(),
      'image1': image1.toJson(),
      'image2': image2.toJson(),
      'image3': image3.toJson(),
      'points': points,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
    };
  }
}
