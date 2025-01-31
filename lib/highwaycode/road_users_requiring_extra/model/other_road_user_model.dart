class HighwayOtherRoadUsersModel {
  final String image;
  final List<String> text;
  final List<String> text1;
  final List<String> text2;

  HighwayOtherRoadUsersModel({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
  });

  factory HighwayOtherRoadUsersModel.fromJson(Map<String, dynamic> json) {
    return HighwayOtherRoadUsersModel(
      image: json['image'] ?? '',
      text: List<String>.from(json['text'] ?? []),
      text1: List<String>.from(json['text1'] ?? []),
      text2: List<String>.from(json['text2'] ?? []),
    );
  }
}
