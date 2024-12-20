class CrossingInfoModel {
  final String image;
  final String image1;
  final String subtitle;
  final String subtitle1;
  final String title;
  final String title1;

  CrossingInfoModel({
    required this.image,
    required this.image1,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
    required this.title1,
  });

  factory CrossingInfoModel.fromFirestore(Map<String, dynamic> data) {
    return CrossingInfoModel(
      image: data['image'] as String,
      image1: data['image1'] as String,
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      title: data['title'] as String,
      title1: data['title1'] as String,
    );
  }
}
