class AttitudeModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;

  AttitudeModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory AttitudeModel.fromFirestore(Map<String, dynamic> data) {
    return AttitudeModel(
      image: data['image'] as String,
      points: List<String>.from(data['points'] as List),
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
    );
  }
}
