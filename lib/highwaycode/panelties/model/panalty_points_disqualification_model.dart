class PenaltyPointsAndDisqualificationModel {
  final String text;

  PenaltyPointsAndDisqualificationModel({
    required this.text,
  });

  factory PenaltyPointsAndDisqualificationModel.fromJson(Map<String, dynamic> json) {
    return PenaltyPointsAndDisqualificationModel(
      text: json['text'] ?? '',
    );
  }
}
