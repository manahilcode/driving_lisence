class MedicalRequirement {
  String? text;


  MedicalRequirement({
    required this.text,

  });

  factory MedicalRequirement.fromJson(Map<String, dynamic> json) {
    return MedicalRequirement(
      text: json['text'] as String?,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,

    };
  }
}
