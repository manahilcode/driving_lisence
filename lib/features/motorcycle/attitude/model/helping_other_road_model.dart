class HelpingOtherRoadModel {
  final Map definition;
  final String subtitle;
  final String title;
  final ImageText image;
  final ImageText image2;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String tip;
  final String title1;

  HelpingOtherRoadModel({
    required this.definition,
    required this.subtitle,
    required this.title,
    required this.image,
    required this.image2,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.tip,
    required this.title1,
  });

  factory HelpingOtherRoadModel.fromFirestore(Map<String, dynamic> data) {
    return HelpingOtherRoadModel(
      definition: data['defination'] as Map,
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
      image: ImageText.fromMap(data['image']),
      image2: ImageText.fromMap(data['image2']),
      subtitle1: data['subtitle1'] as String,
      subtitle2: data['subtitle2'] as String,
      subtitle3: data['subtitle3'] as String,
      tip: data['tip'] as String,
      title1: data['title1'] as String,
    );
  }
}

class ImageText {
  final String image;
  final String text;

  ImageText({
    required this.image,
    required this.text,
  });

  factory ImageText.fromMap(Map<String, dynamic> map) {
    return ImageText(
      image: map['image'] as String,
      text: map['text'] as String,
    );
  }
}
