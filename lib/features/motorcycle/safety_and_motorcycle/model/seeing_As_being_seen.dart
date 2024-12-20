class SeeingAndBeingSeen {
  final String image;
  final String subtitle;
  final String subtitle1;
  final String title;

  SeeingAndBeingSeen({
    required this.image,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  factory SeeingAndBeingSeen.fromJson(Map<String, dynamic> json) {
    return SeeingAndBeingSeen(
      image: json['image'],
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
    };
  }
}
