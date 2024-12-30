class LearningHazardModel {
  final String subtitle;
  final String title;
  final String video;

  LearningHazardModel({
    required this.subtitle,
    required this.title,
    required this.video,

  });

  factory LearningHazardModel.fromJson(Map<String, dynamic> json) {
    return LearningHazardModel(
      subtitle: json['subtitle'],
      title: json['title'],
      video: json['video'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtitle': subtitle,
      'title': title,
      'video': video,

    };
  }
}
