class NoisePollutionModel {
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String subtitle3;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String tip;
  final String tip1;
  final String title;
  final String title1;

  NoisePollutionModel({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.tip,
    required this.tip1,
    required this.title,
    required this.title1,
  });

  factory NoisePollutionModel.fromFirestore(Map<String, dynamic> data) {
    return NoisePollutionModel(
      image: data['image'] as String,
      image1: data['image1'] as String,
      image2: data['image2'] as String,
      image3: data['image3'] as String,
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] as String,
      subtitle2: data['subtitle2'] as String,
      subtitle3: data['subtitle3'] as String,
      text: data['text'] as String,
      text1: data['text1'] as String,
      text2: data['text2'] as String,
      text3: data['text3'] as String,
      tip: data['tip'] as String,
      tip1: data['tip1'] as String,
      title: data['title'] as String,
      title1: data['title1'] as String,
    );
  }
}
