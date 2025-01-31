class LightingRequirement {
  final List<String> text;

  LightingRequirement({required this.text});

  factory LightingRequirement.fromMap(Map<String, dynamic> map) {
    return LightingRequirement(
      text: List<String>.from(map['text'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
