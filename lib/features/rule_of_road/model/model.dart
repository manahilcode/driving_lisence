class IntroductionRuleRoad {
  final String? image;
  final List<String>? points;
  final String? title;

  IntroductionRuleRoad({
    required this.image,
    required this.points,
    required this.title,
  });

  factory IntroductionRuleRoad.fromJson(Map<String, dynamic> json) {
    return IntroductionRuleRoad(
      image: json['image'] as String?,
      points:
          (json['points'] as List<dynamic>?)?.map((e) => e as String).toList(),
      title: json['title'] as String?,
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

class SpeedLimit {
  final Map<String, String>? answers;
  final String? question;
  final String? correct;
  final String? defSubtitle1;
  final String? defSubtitle2;
  final String? defTitle1;
  final String? defTitle2;
  final String? image;
  final List<String>? points;
  final String? questionImage;
  final String? subtitle;
  final String? subtitle2;
  final String? title;

  SpeedLimit({
    required this.answers,
    required this.question,
    required this.correct,
    required this.defSubtitle1,
    required this.defSubtitle2,
    required this.defTitle1,
    required this.defTitle2,
    required this.image,
    required this.points,
    required this.questionImage,
    required this.subtitle,
    required this.subtitle2,
    required this.title,
  });

  factory SpeedLimit.fromJson(Map<String, dynamic> json) {
    return SpeedLimit(
      answers: Map<String, String>.from(json['Answers'] as Map),
      question: json['Question'] as String?,
      correct: json['correct'] as String?,
      defSubtitle1: json['def_subtitle1'] as String?,
      defSubtitle2: json['def_subtitle2'] as String?,
      defTitle1: json['def_title1'] as String?,
      defTitle2: json['def_title2'] as String?,
      image: json['image'] as String?,
      points:
          (json['points'] as List<dynamic>?)?.map((e) => e as String).toList(),
      questionImage: json['question_image'] as String?,
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers,
      'question': question,
      'correct': correct,
      'def_subtitle1': defSubtitle1,
      'def_subtitle2': defSubtitle2,
      'def_title1': defTitle1,
      'def_title2': defTitle2,
      'image': image,
      'points': points,
      'question_image': questionImage,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}

class SpeedLimit2 {
  final String? image;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? imageCaption1;
  final String? imageCaption2;
  final String? imageCaption3;
  final String? selfReflectionSubtitle;
  final String? selfReflectionTitle;
  final String? subtitle;
  final String? subtitle2;

  SpeedLimit2({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.imageCaption1,
    required this.imageCaption2,
    required this.imageCaption3,
    required this.selfReflectionSubtitle,
    required this.selfReflectionTitle,
    required this.subtitle,
    required this.subtitle2,
  });

  factory SpeedLimit2.fromJson(Map<String, dynamic> json) {
    return SpeedLimit2(
      image: json['image'] as String?,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      imageCaption1: json['image_caption1'] as String?,
      imageCaption2: json['image_caption2'] as String?,
      imageCaption3: json['image_caption3'] as String?,
      selfReflectionSubtitle: json['self_reflection_subtitle'] as String?,
      selfReflectionTitle: json['self_reflection_title'] as String?,
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image_caption1': imageCaption1,
      'image_caption2': imageCaption2,
      'image_caption3': imageCaption3,
      'self_reflection_subtitle': selfReflectionSubtitle,
      'self_reflection_title': selfReflectionTitle,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
    };
  }
}

class LanesAndJunctions {
  final Map<String, String>? answers;
  final String? question;
  final String? correct;
  final String? subtitle;
  final String? subtitle2;
  final String? subtitle3;
  final String? subtitle4;
  final String? title;

  LanesAndJunctions({
    required this.answers,
    required this.question,
    required this.correct,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.title,
  });

  factory LanesAndJunctions.fromJson(Map<String, dynamic> json) {
    return LanesAndJunctions(
      answers: (json['Answers'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
      question: json['Question'] as String?,
      correct: json['correct'] as String?,
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      subtitle3: json['subtitle3'] as String?,
      subtitle4: json['subtitle4'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers,
      'question': question,
      'correct': correct,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'title': title,
    };
  }
}

class LaneAndJunction2 {
  final String? image1;
  final String? image2;
  final String? image3;
  final List<String>? points;
  final String? subtitle;
  final String? subtitle1;
  final String? subtitle2;
  final String? subtitle3;
  final String? subtitle4;
  final String? tip;
  final String? title;
  final String? title2;

  LaneAndJunction2({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.tip,
    required this.title,
    required this.title2,
  });

  factory LaneAndJunction2.fromJson(Map<String, dynamic> json) {
    return LaneAndJunction2(
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((point) => point as String)
          .toList(),
      subtitle: json['subtitle'] as String?,
      subtitle1: json['subtitle1'] as String?,
      subtitle2: json['subtitle2'] as String?,
      subtitle3: json['subtitle3'] as String?,
      subtitle4: json['subtitle4'] as String?,
      tip: json['tip'] as String?,
      title: json['title'] as String?,
      title2: json['title2'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'points': points,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'tip': tip,
      'title': title,
      'title2': title2,
    };
  }
}

class Overtaking {
  final String? subtitle;
  final String? subtitle2;
  final String? tip;
  final String? title;

  Overtaking({
    required this.subtitle,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  factory Overtaking.fromJson(Map<String, dynamic> json) {
    return Overtaking(
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      tip: json['tip'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'tip': tip,
      'title': title,
    };
  }
}

class Reversing {
  final String? question;
  final Map<String, String>? answers;
  final String? correctAnswer;
  final String? image;
  final List<String>? points;
  final String? subtitle;
  final String? title;

  Reversing({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory Reversing.fromJson(Map<String, dynamic> json) {
    return Reversing(
      question: json['Question'] as String?,
      answers: (json['answers'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, value as String),
      ),
      correctAnswer: json['correct'] as String?,
      image: json['image'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      subtitle: json['subtitle'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answers': answers,
      'correct': correctAnswer,
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}

class PedestrianCrossing {
  final String? title;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;

  final String? imageCaption1;
  final String? imageCaption2;
  final String? imageCaption3;

  PedestrianCrossing({
    required this.title,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.imageCaption1,
    required this.imageCaption2,
    required this.imageCaption3,
  });

  factory PedestrianCrossing.fromJson(Map<String, dynamic> json) {
    return PedestrianCrossing(
      title: json['title'] as String?,
      image1: json["image1"],
      image2: json["image2"],
      image3: json["image3"],
      image4: json["image4"],
      imageCaption1: json["image_caption1"],
      imageCaption2: json["image_caption2"],
      imageCaption3: json["image_caption3"],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'title': title,
  //     'images': images,
  //     'image_captions': imageCaptions,
  //   };
  // }
}

class LevelCrossing {
  final String title;
  final String subtitle;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String image6;
  final String image7;
  final String imageCaption1;
  final String imageCaption2;
  final String imageCaption3;
  final String imageCaption4;
  final String imageCaption5;
  final String imageCaption6;
  final String imageCaption5_1;
  final String imageCaption6_1;
  final String imageCaption4_1;

  LevelCrossing({
    required this.title,
    required this.subtitle,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.image7,
    required this.imageCaption1,
    required this.imageCaption2,
    required this.imageCaption3,
    required this.imageCaption4,
    required this.imageCaption5,
    required this.imageCaption6,
    required this.imageCaption5_1,
    required this.imageCaption6_1,
    required this.imageCaption4_1,
  });

  // Optional: Add a factory constructor for creating an instance from a JSON map.
  factory LevelCrossing.fromJson(Map<String, dynamic> json) {
    return LevelCrossing(
      title: json['title'],
      subtitle: json['subtitle'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      image4: json['image4'],
      image5: json['image5'],
      image6: json['image6'],
      image7: json['image7'],
      imageCaption1: json['image_caption1'],
      imageCaption2: json['image_caption2'],
      imageCaption3: json['image_caption3'],
      imageCaption4: json['image_caption4.1'],
      imageCaption4_1: json['image_caption4.2'],
      imageCaption5: json['image_caption5.1'],
      imageCaption6: json['image_caption6.1'],
      imageCaption5_1: json['image_caption5.2'],
      imageCaption6_1: json['image_caption6.2'],
    );
  }

  // // Optional: Convert the instance to a JSON map.
  // Map<String, dynamic> toJson() {
  //   return {
  //     'title': title,
  //     'subtitle': subtitle,
  //     'image1': image1,
  //     'image2': image2,
  //     'image3': image3,
  //     'image4': image4,
  //     'image5': image5,
  //     'image6': image6,
  //     'image7': image7,
  //     'imageCaption1': imageCaption1,
  //     'imageCaption2': imageCaption2,
  //     'imageCaption3': imageCaption3,
  //     'imageCaption4_1': imageCaption4_1,
  //     'imageCaption4_2': imageCaption4_2,
  //     'imageCaption5_1': imageCaption5_1,
  //     'imageCaption5_2': imageCaption5_2,
  //     'imageCaption6_1': imageCaption6_1,
  //     'imageCaption6_2': imageCaption6_2,
  //   };
  // }
}

class StoppingAndParking {
  final String controlZoneImage;
  final String image2;
  final List<String> points;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String subtitle5;
  final List<String> tip;
  final String title;

  StoppingAndParking({
    required this.controlZoneImage,
    required this.image2,
    required this.points,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.subtitle5,
    required this.tip,
    required this.title,
  });

  factory StoppingAndParking.fromJson(Map<String, dynamic> json) {
    return StoppingAndParking(
      controlZoneImage: json['control_zone_image'] as String,
      image2: json['image2'] as String,
      points: List<String>.from(json['points']),
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      subtitle3: json['subtitle3'] as String,
      subtitle4: json['subtitle4'] as String,
      subtitle5: json['subtitle5'] as String,
      tip: List<String>.from(json['tip']),
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'control_zone_image': controlZoneImage,
      'image2': image2,
      'points': points,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'subtitle5': subtitle5,
      'tip': tip,
      'title': title,
    };
  }
}

class SmokingInCar {
  final String? title;
  final List<String>? points;

  SmokingInCar({
    required this.title,
    required this.points,
  });

  factory SmokingInCar.fromJson(Map<String, dynamic> json) {
    return SmokingInCar(
      title: json['title'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'points': points,
    };
  }
}

class MeetingStandards {
  final String? title;
  final List<String>? points;
  final String? subtitle1;
  final String? subtitle2;

  MeetingStandards({
    required this.title,
    required this.points,
    required this.subtitle1,
    required this.subtitle2,
  });

  factory MeetingStandards.fromJson(Map<String, dynamic> json) {
    return MeetingStandards(
      title: json['title'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      subtitle1: json['subtitle1'] as String?,
      subtitle2: json['subtitle2'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'points': points,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
    };
  }
}

class ThinkAbout {
  final String? title;
  final List<String>? points;

  ThinkAbout({
    required this.title,
    required this.points,
  });

  factory ThinkAbout.fromJson(Map<String, dynamic> json) {
    return ThinkAbout(
      title: json['title'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'points': points,
    };
  }
}

class ThingsToDiscussPractice {
  final String? title;
  final String? subtitle;
  final List<String>? points;
  final List<String>? points1;
  final String? title1;
  final String? title2;

  ThingsToDiscussPractice({
    required this.title,
    required this.subtitle,
    required this.points,
    required this.points1,
    required this.title1,
    required this.title2,
  });

  factory ThingsToDiscussPractice.fromJson(Map<String, dynamic> json) {
    return ThingsToDiscussPractice(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      points1: (json['points1'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      title1: json['title2'] as String?,
      title2: json['title3'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'points': points,
      'points1': points1,
    };
  }
}
