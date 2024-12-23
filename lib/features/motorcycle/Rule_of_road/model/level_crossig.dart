// Model
class LevelCrossingModel {
  final String title;
  final String subtitle;
  final String subtitle1;
  final List<Map<String, String>> image;
  final List<Map<String, String>> image1;
  final List<Map<String, String>> image2;
  final List<Map<String, String>> image4;
  final List<Map<String, String>> image5;
  final List<Map<String, String>> image6;

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
    List<Map<String, String>> parseImages(List images) {
      return images.map((image) {
        if (image is Map) {
          return Map<String, String>.from(
              image.map((key, value) => MapEntry(key.toString(), value.toString()))
          );
        }
        return <String, String>{};
      }).toList();
    }

    return LevelCrossingModel(
      title: map['title']?.toString() ?? '',
      subtitle: map['subtitle']?.toString() ?? '',
      subtitle1: map['subtitle1']?.toString() ?? '',
      image: parseImages(map['image'] ?? []),
      image1: parseImages(map['image1'] ?? []),
      image2: parseImages(map['image2'] ?? []),
      image4: parseImages(map['image4'] ?? []),
      image5: parseImages(map['image5'] ?? []),
      image6: parseImages(map['image6'] ?? []),
    );
  }
}