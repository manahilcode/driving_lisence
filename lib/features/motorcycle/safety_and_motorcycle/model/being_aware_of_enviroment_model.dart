class BeingAwareOfTheEnvironmentModel {
  final String reduce;
  final List<String> points;
  final String subtitle;
  final String title;

  BeingAwareOfTheEnvironmentModel({
    required this.reduce,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory BeingAwareOfTheEnvironmentModel.fromFirestore(Map<String, dynamic> data) {
    return BeingAwareOfTheEnvironmentModel(
      reduce: data['Reduce'] as String,
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] as String,
      title: data['title'] as String,
    );
  }
}
