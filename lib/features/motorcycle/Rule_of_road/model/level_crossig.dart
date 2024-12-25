// Model
class LevelCrossingModel {
  final String title;
  final String subtitle;
  final String subtitle1;
  final List<String> image;
  final List<String> image1;
  final List<String> image2;
  final List<String> image4;
  final List<String> image5;
  final List<String> image6;

  LevelCrossingModel({
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image4,
    required this.image5,
    required this.image6,
  });

  factory LevelCrossingModel.fromMap(Map<String, dynamic> map) {

    return LevelCrossingModel(
      title: map['title']?.toString() ?? '',
      subtitle: map['subtitle']?.toString() ?? '',
      subtitle1: map['subtitle1']?.toString() ?? '',
      image: (map['image'] ?? []),
      image1: (map['image1'] ?? []),
      image2: (map['image2'] ?? []),
      image4: (map['image4'] ?? []),
      image5: (map['image5'] ?? []),
      image6: (map['image6'] ?? []),
    );
  }
}