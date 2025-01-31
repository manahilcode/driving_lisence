class PreparingForTest {
  String? text;


  PreparingForTest({
    required this.text,

  });

  factory PreparingForTest.fromJson(Map<String, dynamic> json) {
    return PreparingForTest(
      text: json['text'] as String?,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,

    };
  }
}
