class AnticipationModel {
  final List<DefinitionItem> definitions;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String title;
  final String title1;
  final String title2;
  final String image;
  final List<ImageTextItem> imageItems;
  final List<String> points;
  final List<String> points1;

  AnticipationModel({
    required this.definitions,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
    required this.title1,
    required this.title2,
    required this.image,
    required this.imageItems,
    required this.points,
    required this.points1,
  });

  factory AnticipationModel.fromFirestore(Map<String, dynamic> json) {
    return AnticipationModel(
      definitions: (json['definition'] as List<dynamic>)
          .map((item) => DefinitionItem.fromFirestore(item))
          .toList(),
      subtitle: json['subtitle'] as String,
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      subtitle3: json['subtitle3'] as String,
      title: json['title'] as String,
      title1: json['title1'] as String,
      title2: json['title2'] as String,
      image: json['image'] as String,
      imageItems: (json['image1'] as List<dynamic>)
          .map((item) => ImageTextItem.fromFirestore(item))
          .toList(),
      points: List<String>.from(json['points'] ?? []),
      points1: List<String>.from(json['points1'] ?? []),
    );
  }
}

class DefinitionItem {
  final String title;
  final String title1;
  final String subtitle;
  final String subtitle1;
  final String image;

  DefinitionItem({
    required this.title,
    required this.title1,
    required this.subtitle,
    required this.subtitle1,
    required this.image,
  });

  factory DefinitionItem.fromFirestore(Map<String, dynamic> json) {
    return DefinitionItem(
      title: json['title'] as String,
      title1: json['title1'] as String,
      subtitle: json['subtitle'] as String,
      subtitle1: json['subtitle1'] as String,
      image: json['image'] as String,
    );
  }
}

class ImageTextItem {
  final String image;
  final String text;

  ImageTextItem({
    required this.image,
    required this.text,
  });

  factory ImageTextItem.fromFirestore(Map<String, dynamic> json) {
    return ImageTextItem(
      image: json['image'] as String,
      text: json['text'] as String,
    );
  }
}
