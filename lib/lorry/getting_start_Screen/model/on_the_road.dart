class OnTheRoad {
  String? text;


  OnTheRoad({
    required this.text,

  });

  factory OnTheRoad.fromJson(Map<String, dynamic> json) {
    return OnTheRoad(
      text: json['text'] as String?,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,

    };
  }
}
