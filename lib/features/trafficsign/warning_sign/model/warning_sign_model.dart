class SignWarningSign221 {
  final List<String> text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;
  final List<String> text6;
  final List<String> text7;

  SignWarningSign221({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
  });

  factory SignWarningSign221.fromJson(Map<String, dynamic> json) {
    return SignWarningSign221(
      text: json['text'].cast<String>(),
      text1: json['text1'].cast<String>(),
      text2: json['text2'].cast<String>(),
      text3: json['text3'].cast<String>(),
      text4: json['text4'].cast<String>(),
      text5: json['text5'].cast<String>(),
      text6: json['text6'].cast<String>(),
      text7: json['text7'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
      'text6': text6,
      'text7': text7,
    };
  }
}