class IntroductionAlert {
  final String image;
  final List<String> points;
  final String subtitle;
  final String tip;
  final String title;

  IntroductionAlert({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory IntroductionAlert.fromJson(Map<String, dynamic> json) {
    return IntroductionAlert(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      tip: json['tip '] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'tip': tip,
      'title': title,
    };
  }
}
class ObservationAwareness {
  final List<String> points;
  final String subtitle;
  final String title;

  ObservationAwareness({
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory ObservationAwareness.fromJson(Map<String, dynamic> json) {
    return ObservationAwareness(
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
class Anticipation {
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final List<String> points;
  final List<String> points2;
  final String subtitle;
  final String subtitle2;
  final String subtitle3;
  final String title;

  Anticipation({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.points,
    required this.points2,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
  });

  factory Anticipation.fromJson(Map<String, dynamic> json) {
    return Anticipation(
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
      image4: json['image4'] as String,
      image5: json['image5'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      points2: List<String>.from(json['points2'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      subtitle2: json['subtitle2'] as String,
      subtitle3: json['subtitle3'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'points': points,
      'points2': points2,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'title': title,
    };
  }
}
class AvoidingTiredness {
  final String image;
  final List<String> points;
  final String tip;
  final String title;

  AvoidingTiredness({
    required this.image,
    required this.points,
    required this.tip,
    required this.title,
  });

  factory AvoidingTiredness.fromJson(Map<String, dynamic> json) {
    return AvoidingTiredness(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      tip: json['tip'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'tip': tip,
      'title': title,
    };
  }
}
class Distraction {
  final Map<String, String> answers;
  final String question;
  final String correct;
  final String image1;
  final String image2;
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String subtitle3;
  final String title;

  Distraction({
    required this.answers,
    required this.question,
    required this.correct,
    required this.image1,
    required this.image2,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
  });

  factory Distraction.fromJson(Map<String, dynamic> json) {
    return Distraction(
      answers: Map<String, String>.from(json['Answers'] as Map<dynamic, dynamic>),
      question: json['Question'] as String,
      correct: json['correct'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      subtitle2: json['subtitle2'] as String,
      subtitle3: json['subtitle3'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers,
      'question': question,
      'correct': correct,
      'image1': image1,
      'image2': image2,
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'title': title,
    };
  }
}

class ThinkAboutAlert {
  final List<String> points;
  final String title;

  ThinkAboutAlert({
    required this.points,
    required this.title,
  });

  factory ThinkAboutAlert.fromJson(Map<String, dynamic> json) {
    return ThinkAboutAlert(
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
class BeingSeenByOthers {
  final String image;
  final List<String> points;
  final String subtitle;
  final String tip;
  final String title;

  BeingSeenByOthers({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory BeingSeenByOthers.fromJson(Map<String, dynamic> json) {
    return BeingSeenByOthers(
      image: json['image'] as String,
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      tip: json['tip'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'tip': tip,
      'title': title,
    };
  }
}
class DiscussInstructorAlert {
  final List<String> points;
  final List<String> points2;
  final String subtitle;
  final String title;
  final String title2;
  final String title3;

  DiscussInstructorAlert({
    required this.points,
    required this.points2,
    required this.subtitle,
    required this.title,
    required this.title2,
    required this.title3,
  });

  factory DiscussInstructorAlert.fromJson(Map<String, dynamic> json) {
    return DiscussInstructorAlert(
      points: List<String>.from(json['points'] as List<dynamic>),
      points2: List<String>.from(json['points2'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
      title2: json['title2'] as String,
      title3: json['title3'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'points2': points2,
      'subtitle': subtitle,
      'title': title,
      'title2': title2,
      'title3': title3,
    };
  }
}
class ClearViewAlert {
  final String image;
  final String subtitle;
  final String title;

  ClearViewAlert({
    required this.image,
    required this.subtitle,
    required this.title,
  });

  factory ClearViewAlert.fromJson(Map<String, dynamic> json) {
    return ClearViewAlert(
      image: json['image'] as String,
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
class MeetingStandardAlert {
  final List<String> points1;
  final List<String> points2;
  final String subtitle;
  final String title;
  final String title2;
  final String title3;

  MeetingStandardAlert({
    required this.points1,
    required this.points2,
    required this.subtitle,
    required this.title,
    required this.title2,
    required this.title3,
  });

  factory MeetingStandardAlert.fromJson(Map<String, dynamic> json) {
    return MeetingStandardAlert(
      points1: List<String>.from(json['points1']),
      points2: List<String>.from(json['points2']),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
      title2: json['title2'] as String,
      title3: json['title3'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points1': points1,
      'points2': points2,
      'subtitle': subtitle,
      'title': title,
      'title2': title2,
      'title3': title3,
    };
  }
}

class OvertakingAlert {
  final List<String> points;
  final String title;

  OvertakingAlert({
    required this.points,
    required this.title,
  });

  factory OvertakingAlert.fromJson(Map<String, dynamic> json) {
    return OvertakingAlert(
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

class StayingFocusedAlert {
  final List<String> points;
  final String subtitle;
  final String title;

  StayingFocusedAlert({
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory StayingFocusedAlert.fromJson(Map<String, dynamic> json) {
    return StayingFocusedAlert(
      points: List<String>.from(json['points'] as List<dynamic>),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}


