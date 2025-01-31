class HighwayCodeHelpInvolved {
  final String text;

  HighwayCodeHelpInvolved({
    required this.text,
  });

  factory HighwayCodeHelpInvolved.fromMap(Map<String, dynamic> map) {
    return HighwayCodeHelpInvolved(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
