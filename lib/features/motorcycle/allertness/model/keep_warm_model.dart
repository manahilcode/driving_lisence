class KeepingWarmModel {
  final String image;
  final String subtitle;
  final String title;

  KeepingWarmModel({
    required this.image,
    required this.subtitle,
    required this.title,
  });

  factory KeepingWarmModel.fromFirestore(Map<String, dynamic> data) {
    return KeepingWarmModel(
      image: data['image'] as String,
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
    );
  }
}
