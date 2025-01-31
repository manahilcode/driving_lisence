class MopedLicenceRequirementsModel {
  final String text;
  final List<String> text1;
  final String text2;

  MopedLicenceRequirementsModel({
    required this.text,
    required this.text1,
    required this.text2,
  });

  factory MopedLicenceRequirementsModel.fromJson(Map<String, dynamic> json) {
    return MopedLicenceRequirementsModel(
      text: json['text'] ?? '',
      text1: List<String>.from(json['text1'] ?? []),
      text2: json['text2'] ?? '',
    );
  }
}
