class HighwayCodeOverviewModel {
  final String text;

  HighwayCodeOverviewModel({
    required this.text,
  });

  factory HighwayCodeOverviewModel.fromJson(Map<String, dynamic> json) {
    return HighwayCodeOverviewModel(
      text: json['text'] ?? '',
    );
  }
}
