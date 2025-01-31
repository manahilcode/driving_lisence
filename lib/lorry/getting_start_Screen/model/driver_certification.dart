class DriverCertification {
  String? text;


  DriverCertification({
    required this.text,

  });

  factory DriverCertification.fromJson(Map<String, dynamic> json) {
    return DriverCertification(
      text: json['text'] as String?,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,

    };
  }
}
