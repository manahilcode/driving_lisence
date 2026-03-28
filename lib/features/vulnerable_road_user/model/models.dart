class CyclistVulnerable {
  final String? image1;
  final String? image3;
  final List<String>? points;
  final String? subtitle;
  final String? subtitle2;
  final String? subtitle3;
  final String? subtitle4;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;

  CyclistVulnerable({
    this.image1,
    this.image3,
    this.points,
    this.subtitle,
    this.subtitle2,
    this.subtitle3,
    this.subtitle4,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
  });

  factory CyclistVulnerable.fromJson(Map<String, dynamic> json) {
    return CyclistVulnerable(
      image1: json['image1'] as String?,
      image3: json['image3'] as String?,
      points: (json['points'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      subtitle3: json['subtitle3'] as String?,
      subtitle4: json['subtitle4'] as String?,
      title1: json['title1'] as String?,
      title2: json['title2'] as String?,
      title3: json['title3'] as String?,
      title4: json['title4'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image3': image3,
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'title1': title1,
      'title2': title2,
      'title3': title3,
      'title4': title4,
    };
  }
}

class VulnerableRoadIntroduction {
  final String image;
  final List<String> points;
  final String title;


  VulnerableRoadIntroduction({
    required this.image,
    required this.points,
    required this.title,
  });

  factory VulnerableRoadIntroduction.fromJson(Map<String, dynamic> json) {
    return VulnerableRoadIntroduction(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
class PedestrianVulnerableRoad {
  final String imageCaption3;
  final String imageCaption4;
  final List<String> imageCaption5;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String tip;
  final List<String> tip2;
  final String title;
  final String title2;
  final String title3;
  final String title4;
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final String image4;

  PedestrianVulnerableRoad( {
    required this.imageCaption3,
    required this.imageCaption4,
    required this.imageCaption5,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.tip,
    required this.tip2,
    required this.title,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });

  factory PedestrianVulnerableRoad.fromJson(Map<String, dynamic> json) {
    return PedestrianVulnerableRoad(
      imageCaption3: json['image_caption3'] as String,
      imageCaption4: json['image_caption4'] as String,
      imageCaption5: List<String>.from(json['image_caption5'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      subtitle3: json['subtitle3'] as String,
      tip: json['tip'] as String,
      tip2: List<String>.from(json['tip2'] as List<dynamic>),
      title: json['title'] as String,
      title2: json['title2'] as String,
      title3: json['title3'] as String,
      title4: json['title4'] as String,
      image: json['image'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
      image4: json['image4'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_caption3': imageCaption3,
      'image_caption4': imageCaption4,
      'image_caption5': imageCaption5,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'tip': tip,
      'tip2': tip2,
      'title': title,
      'title2': title2,
      'title3': title3,
      'title4': title4,
    };
  }
}
class VulnerableRoadUser {
  final Map<String, String> answers;
  final String question;
  final String correct;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final List<String> points;
  final String subtitle;
  final String title;

  VulnerableRoadUser({
    required this.answers,
    required this.question,
    required this.correct,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory VulnerableRoadUser.fromJson(Map<String, dynamic> json) {
    return VulnerableRoadUser(
      answers: Map<String, String>.from(json['Answers'] as Map<dynamic, dynamic>),
      question: json['Question'] as String,
      correct: json['correct'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
      image4: json['image4'] as String,
      image5: json['image5'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Answers': answers,
      'Question': question,
      'correct': correct,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
class OlderDisabledPedestrians {
  final String image1;
  final String image2;
  final String subtitle1;
  final String subtitle2;
  final String title;

  OlderDisabledPedestrians({
    required this.image1,
    required this.image2,
    required this.subtitle1,
    required this.subtitle2,
    required this.title,
  });

  factory OlderDisabledPedestrians.fromJson(Map<String, dynamic> json) {
    return OlderDisabledPedestrians(
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}


class RoadObjectAndMotorcyclist {
  final String definition;
  final String image;
  final String image1;
  final String lane;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String tip;
  final String title;
  final String title1;

  RoadObjectAndMotorcyclist({
    required this.definition,
    required this.image,
    required this.image1,
    required this.lane,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.tip,
    required this.title,
    required this.title1,
  });

  factory RoadObjectAndMotorcyclist.fromJson(Map<String, dynamic> json) {
    return RoadObjectAndMotorcyclist(
      definition: json['definition'] as String,
      image: json['image'] as String,
      image1: json['image1'] as String,
      lane: json['lane'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      tip: json['tip'] as String,
      title: json['title'] as String,
      title1: json['title1'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'definition': definition,
      'image': image,
      'image1': image1,
      'lane': lane,
      'points': points,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'tip': tip,
      'title': title,
      'title1': title1,
    };
  }
}

class AnimalsVulnerable {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;
  final String subtitle1;
  AnimalsVulnerable({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
    required this.subtitle1
  });

  factory AnimalsVulnerable.fromJson(Map<String, dynamic> json) {
    return AnimalsVulnerable(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
      subtitle1: json["subtitle1"] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
class DiscussInstructorVulnerable {
  final List<String> points;
  final List<String> points2;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  DiscussInstructorVulnerable({
    required this.points,
    required this.points2,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory DiscussInstructorVulnerable.fromJson(Map<String, dynamic> json) {
    return DiscussInstructorVulnerable(
      points: List<String>.from(json['points'] as List<dynamic>),
      points2: List<String>.from(json['points2'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
      title1: json['title1'] as String,
      title2: json['title2'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'points2': points2,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
class MeetingStandardVulnerable {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  MeetingStandardVulnerable({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory MeetingStandardVulnerable.fromJson(Map<String, dynamic> json) {
    return MeetingStandardVulnerable(
      points: List<String>.from(json['points'] as List<dynamic>),
      points1: List<String>.from(json['points1'] as List<dynamic>),
      title: json['title'] as String,
      title1: json['title1'] as String,
      title2: json['title2'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'points1': points1,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
class OtherDriverVulnerable {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String tip;
  final String title;
  final String title1;

  OtherDriverVulnerable({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.tip,
    required this.title,
    required this.title1,
  });

  factory OtherDriverVulnerable.fromJson(Map<String, dynamic> json) {
    return OtherDriverVulnerable(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      subtitle3: json['subtitle3'] as String,
      tip: json['tip'] as String,
      title: json['title'] as String,
      title1: json['title1'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'tip': tip,
      'title': title,
      'title1': title1,
    };
  }
}
class ThinkAboutVulnerable {
  final List<String> points;
  final String title;

  ThinkAboutVulnerable({
    required this.points,
    required this.title,
  });

  factory ThinkAboutVulnerable.fromJson(Map<String, dynamic> json) {
    return ThinkAboutVulnerable(
      points: List<String>.from(json['points'] as List<dynamic>),
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'title': title,
    };
  }
}


