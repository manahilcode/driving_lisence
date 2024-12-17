class CluesModel {
  final List<String> image;
  final List<String> image1;
  final List<String> image2;
  final List<String> image3;
  final List<String> image4;
  final List<String> image5;
  final List<String> image6;
  final String subtitle;
  final String subtitle1;
  final String title;
  final String video;

  CluesModel({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
    required this.video,
  });

  factory CluesModel.fromJson(Map<String, dynamic> json) {
    return CluesModel(
      image: List<String>.from(json['image']),
      image1: List<String>.from(json['image1']),
      image2: List<String>.from(json['image2']),
      image3: List<String>.from(json['image3']),
      image4: List<String>.from(json['image4']),
      image5: List<String>.from(json['image5']),
      image6: List<String>.from(json['image6']),
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      title: json['title'],
      video: json['video'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'image6': image6,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
      'video': video,
    };
  }
}
