class GivingPriorityToOthersModel {
  final String image;
  final Map<String, String> image1;
  final Map<String, String> image2;
  final Map<String, String> image3;
  final Map<String, String> image4;
  final String subtitle;
  final String subtitle1;
  final String title;
  final String title1;

  GivingPriorityToOthersModel({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
    required this.title1,
  });

  factory GivingPriorityToOthersModel.fromFirestore(Map<String, dynamic> data) {
    return GivingPriorityToOthersModel(
      image: data['image'] as String,
      image1: Map<String, String>.from(data['image1']),
      image2: Map<String, String>.from(data['image2']),
      image3: Map<String, String>.from(data['image3']),
      image4: Map<String, String>.from(data['image4']),
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      title: data['title'] as String,
      title1: data['title1'] as String,
    );
  }
}
