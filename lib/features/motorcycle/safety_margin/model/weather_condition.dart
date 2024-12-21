class WeatherConditionModel {
  String ford;
  Map<String, Map<String, String>> images;
  String reflection;
  String subtitle;
  String tip;
  String title;

  WeatherConditionModel({
    required this.ford,
    required this.images,
    required this.reflection,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  // Convert Firestore data to model
  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    Map<String, Map<String, String>> images = {};

    // Loop through the keys for image1 to image5, extracting image and text
    for (int i = 1; i <= 5; i++) {
      String key = 'image$i';
      if (json[key] != null) {
        images[key] = {
          'image': json[key]['image'] ?? '',
          'text': json[key]['text'] ?? '',
        };
      }
    }

    return WeatherConditionModel(
      ford: json['ford'] ?? '',
      images: images,
      reflection: json['reflection'] ?? '',
      subtitle: json['subtitle'] ?? '',
      tip: json['tip'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
