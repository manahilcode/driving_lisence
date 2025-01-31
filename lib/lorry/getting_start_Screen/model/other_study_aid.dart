class OtherStudyAid {
  String? text;
  String? text1;
  String? text2;

  OtherStudyAid({
    required this.text,
    required this.text1,
    required this.text2
  });

  factory OtherStudyAid.fromJson(Map<String, dynamic> json) {
    return OtherStudyAid(
      text: json['text'] as String?,
      text1: json['text1'] as String?,
      text2: json['text2'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2
    };
  }
}
