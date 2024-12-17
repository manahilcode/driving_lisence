class WhatIfModel {
  final String title;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String video;
  final String video1;


  WhatIfModel({
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.video,
    required this.video1,
    required this.subtitle,
  });

  // Convert to a map for easy JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'video': video,
      'video1': video1,
    };
  }

  // Convert from a map to the object (for deserialization)
  factory WhatIfModel.fromMap(Map<String, dynamic> map) {
    return WhatIfModel(
      title: map['title'] ?? '',
      subtitle1: map['subtitle1'] ?? '',
      subtitle2: map['subtitle2'] ?? '',
      subtitle3: map['subtitle3'] ?? '',
      video: map['video'] ?? '',
      video1: map['video1'] ?? '',
      subtitle: map['subtitle']
    );
  }
}
