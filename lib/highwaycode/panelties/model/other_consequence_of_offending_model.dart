class OtherConsequencesOfOffendingModel {
  final String text;

  OtherConsequencesOfOffendingModel({
    required this.text,
  });

  factory OtherConsequencesOfOffendingModel.fromJson(Map<String, dynamic> json) {
    return OtherConsequencesOfOffendingModel(
      text: json['text'] ?? '',
    );
  }
}
