class BeingSeenModel {
  final String image;
  final List<String> points;
  final String selfReflection;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  BeingSeenModel({
    required this.image,
    required this.points,
    required this.selfReflection,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  factory BeingSeenModel.fromFirestore(Map<String, dynamic> data) {
    return BeingSeenModel(
      image: data['image'] as String,
      points: List<String>.from(data['points'] as List),
      selfReflection: data['self_reflection'] as String,
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      tip: data['tip'] as String,
      title: data['title'] as String,
    );
  }
}
