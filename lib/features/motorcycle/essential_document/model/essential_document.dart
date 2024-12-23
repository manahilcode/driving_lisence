class EssentialDocumentsEss {
  final String image;
  final List<String> points;
  final String title;

  EssentialDocumentsEss({
    required this.image,
    required this.points,
    required this.title,
  });

  factory EssentialDocumentsEss.fromJson(Map<String, dynamic> json) {
    return EssentialDocumentsEss(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List),
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
