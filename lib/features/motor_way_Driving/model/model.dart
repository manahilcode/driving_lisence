class IntroductionHighway {
  final String image;
  final List<String> points;
  final String title;

  // Constructor
  IntroductionHighway({
    required this.image,
    required this.points,
    required this.title,
  });

  // Factory method to create a model instance from Firestore data
  factory IntroductionHighway.fromFirestore(Map<String, dynamic> data) {
    return IntroductionHighway(
      image: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}

class MotorwayDriving {
  final Map<int, String> answers;
  final String question;
  final String correctAnswer;
  final String image1;
  final String image2;
  final List<String> points;
  final String subtitle;
  final String tip;
  final String title;

  // Constructor
  MotorwayDriving({
    required this.answers,
    required this.question,
    required this.correctAnswer,
    required this.image1,
    required this.image2,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  // Factory method to create a model instance from Firestore data
  factory MotorwayDriving.fromFirestore(Map<String, dynamic> data) {
    return MotorwayDriving(
      answers: (data['Answer'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(int.parse(key), value as String),
      ),
      question: data['Question'] ?? '',
      correctAnswer: data['correct'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'answers': answers.map((key, value) => MapEntry(key.toString(), value)), // Convert keys back to string
      'question': question,
      'correctAnswer': correctAnswer,
      'image1': image1,
      'image2': image2,
      'points': points,
      'subtitle': subtitle,
      'tip': tip,
      'title': title,
    };
  }
}


class DrivingOnMotorway {
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String subtitle5;
  final String image;

  // Constructor
  DrivingOnMotorway({
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.subtitle5,
    required this.image
  });

  // Factory method to create a model instance from Firestore data
  factory DrivingOnMotorway.fromFirestore(Map<String, dynamic> data) {
    return DrivingOnMotorway(
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      subtitle4: data['subtitle4'] ?? '',
      subtitle5: data['subtitle5'] ?? '',
      image:  data['image'] ?? ''
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'subtitle5': subtitle5,
    };
  }
}
class SpeedLimit {
  final Map<String, String> answers;
  final String question;
  final String correct;
  final String image1;
  final String image2;
  final List<String> points1;
  final List<String> points2;
  final String tip;

  // Constructor
  SpeedLimit({
    required this.answers,
    required this.question,
    required this.correct,
    required this.image1,
    required this.image2,
    required this.points1,
    required this.points2,
    required this.tip,
  });

  // Factory method to create a model instance from Firestore data
  factory SpeedLimit.fromFirestore(Map<String, dynamic> data) {
    return SpeedLimit(
      answers: Map<String, String>.from(data['Answers'] ?? {}),
      question: data['Question'] ?? '',
      correct: data['correct'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      points1: List<String>.from(data['points1'] ?? []),
      points2: List<String>.from(data['points2'] ?? []),
      tip: data['tip'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'answers': answers,
      'question': question,
      'correct': correct,
      'image1': image1,
      'image2': image2,
      'points1': points1,
      'points2': points2,
      'tip': tip,
    };
  }
}
class ReduceCongestion {
  final String defSubtitle1;
  final String defSubtitle2;
  final String defSubtitle3;
  final String defTitle1;
  final String defTitle2;
  final String defTitle3;
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String title;
  final String image;

  // Constructor
  ReduceCongestion({
    required this.defSubtitle1,
    required this.defSubtitle2,
    required this.defSubtitle3,
    required this.defTitle1,
    required this.defTitle2,
    required this.defTitle3,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.title,
    required this.image,
  });

  // Factory method to create a model instance from Firestore data
  factory ReduceCongestion.fromFirestore(Map<String, dynamic> data) {
    return ReduceCongestion(
      defSubtitle1: data['def_subtitle1'] ?? '',
      defSubtitle2: data['def_subtitle2'] ?? '',
      defSubtitle3: data['def_subtitle3'] ?? '',
      defTitle1: data['def_title1'] ?? '',
      defTitle2: data['def_title2'] ?? '',
      defTitle3: data['def_title3'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      title: data['title'] ?? '',
      image: data['image'] ?? ''
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'defSubtitle1': defSubtitle1,
      'defSubtitle2': defSubtitle2,
      'defSubtitle3': defSubtitle3,
      'defTitle1': defTitle1,
      'defTitle2': defTitle2,
      'defTitle3': defTitle3,
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}

class LaneMarking {
  final String image;
  final String subtitle;
  final String title;

  // Constructor
  LaneMarking({
    required this.image,
    required this.subtitle,
    required this.title,
  });

  // Factory method to create a model instance from Firestore data
  factory LaneMarking.fromFirestore(Map<String, dynamic> data) {
    return LaneMarking(
      image: data['image'] ?? '',
      subtitle: data['subtitle'] ?? '',
      title: data['title'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
class StoppingAndBreakdowns {
  final String image1;
  final String image2;
  final List<String> points;
  final List<String> points2;
  final List<String> points3;
  final List<String> points4;
  final List<String> points5;
  final String subtitle;
  final String subtitle2;
  final String subtitle3;
  final String title;

  // Constructor
  StoppingAndBreakdowns({
    required this.image1,
    required this.image2,
    required this.points,
    required this.points2,
    required this.points3,
    required this.points4,
    required this.points5,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
  });

  // Factory method to create a model instance from Firestore data
  factory StoppingAndBreakdowns.fromFirestore(Map<String, dynamic> data) {
    return StoppingAndBreakdowns(
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points2: List<String>.from(data['points2'] ?? []),
      points3: List<String>.from(data['points3'] ?? []),
      points4: List<String>.from(data['points4'] ?? []),
      points5: List<String>.from(data['points5'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      title: data['title'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'image1': image1,
      'image2': image2,
      'points': points,
      'points2': points2,
      'points3': points3,
      'points4': points4,
      'points5': points5,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'title': title,
    };
  }
}
class MeetingTheStandards {
  final List<String> points1;
  final List<String> points2;
  final String title1;
  final String title2;

  // Constructor
  MeetingTheStandards({
    required this.points1,
    required this.points2,
    required this.title1,
    required this.title2,
  });

  // Factory method to create a model instance from Firestore data
  factory MeetingTheStandards.fromFirestore(Map<String, dynamic> data) {
    return MeetingTheStandards(
      points1: List<String>.from(data['points1'] ?? []),
      points2: List<String>.from(data['points2'] ?? []),
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points1': points1,
      'points2': points2,
      'title1': title1,
      'title2': title2,
    };
  }
}

class ThinkAbout {
  final List<String> points;

  // Constructor
  ThinkAbout({required this.points});

  // Factory method to create a model instance from Firestore data
  factory ThinkAbout.fromFirestore(Map<String, dynamic> data) {
    return ThinkAbout(
      points: List<String>.from(data['points'] ?? []),
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points': points,
    };
  }
}
class ThingsToDiscussWithInstructor {
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String title;
  final String title2;

  // Constructor
  ThingsToDiscussWithInstructor({
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.title,
    required this.title2,
  });

  // Factory method to create a model instance from Firestore data
  factory ThingsToDiscussWithInstructor.fromFirestore(Map<String, dynamic> data) {
    return ThingsToDiscussWithInstructor(
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      title: data['title'] ?? '',
      title2: data['title2'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'title': title,
      'title2': title2,
    };
  }
}

