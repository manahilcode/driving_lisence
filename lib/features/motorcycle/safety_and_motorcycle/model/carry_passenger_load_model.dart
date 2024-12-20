class CarryingPassengersAndLoadsModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;

  CarryingPassengersAndLoadsModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory CarryingPassengersAndLoadsModel.fromFirestore(Map<String, dynamic> data) {
    return CarryingPassengersAndLoadsModel(
      image: data['image'] as String,
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
    );
  }
}
