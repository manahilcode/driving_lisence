class GettingInfo {
  String? text;
  String? text1;

  GettingInfo({
    required this.text,
    required this.text1,
  });

  factory GettingInfo.fromJson(Map<String, dynamic> json) {
    return GettingInfo(
      text: json['text'] as String?,
      text1: json['text1'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'text1': text1,
    };
  }
}
