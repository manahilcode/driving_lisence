class RuleModel {
  final String text;

  RuleModel({required this.text});

  factory RuleModel.fromMap(Map<String, dynamic> map) {
    return RuleModel(
      text: map['text'] ?? '',
    );
  }
}
