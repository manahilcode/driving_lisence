class SeeingHazardModel {
  final String image;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String title;

  SeeingHazardModel({
    required this.image,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.title,
  });

  factory SeeingHazardModel.fromJson(Map<String, dynamic> json) {
    return SeeingHazardModel(
      image: json['image'],
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      subtitle2: json['subtitle2'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}
