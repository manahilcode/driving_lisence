class HighwayCodeDealWithDanger {
  final String text;

  HighwayCodeDealWithDanger({
    required this.text,
  });

  factory HighwayCodeDealWithDanger.fromMap(Map<String, dynamic> map) {
    return HighwayCodeDealWithDanger(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
