class DistractionModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String title;

  DistractionModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
  });

  factory DistractionModel.fromFirestore(Map<String, dynamic> data) {
    return DistractionModel(
      image: data['image'] as String,
      points: List<String>.from(data['points'] as List),
      subtitle: data['subtitle'] as String,
      subtitle1: data['subtitle1'] as String,
      subtitle2: data['subtitle2'] as String,
      subtitle3: data['subtitle3'] as String,
      title: data['title'] as String,
    );
  }
}
