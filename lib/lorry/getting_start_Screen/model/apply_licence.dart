class ApplyLicence {
  String? text;


  ApplyLicence({
    required this.text,

  });

  factory ApplyLicence.fromJson(Map<String, dynamic> json) {
    return ApplyLicence(
      text: json['text'] as String?,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,

    };
  }
}
