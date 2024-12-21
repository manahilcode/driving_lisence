class SafetyMargin1 {
  final String image;
  final String subtitle;
  final String subtitle1;
  final String title;
  final String title1;

  SafetyMargin1({
    required this.image,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
    required this.title1,
  });

  factory SafetyMargin1.fromJson(Map<String, dynamic> json) {
    return SafetyMargin1(
      image: json['image'],
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      title: json['title'],
      title1: json['title1'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
      'title1': title1,
    };
  }
}
