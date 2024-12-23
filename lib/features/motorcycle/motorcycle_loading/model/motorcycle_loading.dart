class MotorcycleLoadingModel {
  final String image;
  final List<String> points;
  final String title;

  MotorcycleLoadingModel({
    required this.image,
    required this.points,
    required this.title,
  });

  // Factory method to create MotorcycleLoadingModel from a map
  factory MotorcycleLoadingModel.fromMap(Map<String, dynamic> map) {
    return MotorcycleLoadingModel(
      image: map['image'] as String,
      points: List<String>.from(map['points'] ?? []),
      title: map['title'] as String,
    );
  }

  // Convert MotorcycleLoadingModel to a map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
