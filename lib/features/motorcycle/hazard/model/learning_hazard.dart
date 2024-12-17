class LearningHazardModel {
  final String subtitle;
  final String title;
  final String video;
  final String video1;

  LearningHazardModel({
    required this.subtitle,
    required this.title,
    required this.video,
    required this.video1,
  });

  factory LearningHazardModel.fromJson(Map<String, dynamic> json) {
    return LearningHazardModel(
      subtitle: json['subtitle'],
      title: json['title'],
      video: json['video'],
      video1: json['video1'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtitle': subtitle,
      'title': title,
      'video': video,
      'video1': video1,
    };
  }
}
