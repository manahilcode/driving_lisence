class IntroductionEssentialDocument {
  final String image;
  final List<String> points;
  final String title;

  IntroductionEssentialDocument({
    required this.image,
    required this.points,
    required this.title,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory IntroductionEssentialDocument.fromJson(Map<String, dynamic> json) {
    return IntroductionEssentialDocument(
      image: json['image'],
      points: List<String>.from(json['points']),
      title: json['title'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
class DiscussInstructorDocument {
  final List<String> point1;
  final List<String> points2;
  final List<String> points3;
  final String subtitle;
  final String subtitle2;
  final String title;
  final String title2;
  final String title3;
  final String title4;

  DiscussInstructorDocument({
    required this.point1,
    required this.points2,
    required this.points3,
    required this.subtitle,
    required this.subtitle2,
    required this.title,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory DiscussInstructorDocument.fromJson(Map<String, dynamic> json) {
    return DiscussInstructorDocument(
      point1: List<String>.from(json['point1']),
      points2: List<String>.from(json['points2']),
      points3: List<String>.from(json['points3']),
      subtitle: json['subtitle'],
      subtitle2: json['subtitle2'],
      title: json['title'],
      title2: json['title2'],
      title3: json['title3'],
      title4: json['title4'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'point1': point1,
      'points2': points2,
      'points3': points3,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'title': title,
      'title2': title2,
      'title3': title3,
      'title4': title4,
    };
  }
}
class EssentialDocument {
  final List<String> points;
  final String title;

  EssentialDocument({
    required this.points,
    required this.title,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory EssentialDocument.fromJson(Map<String, dynamic> json) {
    return EssentialDocument(
      points: List<String>.from(json['points']),
      title: json['title'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'title': title,
    };
  }
}
class InsuranceEssentialDocument {
  final String image;
  final List<String> points;
  final List<String> points2;
  final String subtitle;
  final String subtitle3;
  final String tip;

  InsuranceEssentialDocument({
    required this.image,
    required this.points,
    required this.points2,
    required this.subtitle,
    required this.subtitle3,
    required this.tip,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory InsuranceEssentialDocument.fromJson(Map<String, dynamic> json) {
    return InsuranceEssentialDocument(
      image: json['image'],
      points: List<String>.from(json['points']),
      points2: List<String>.from(json['points2']),
      subtitle: json['subtitle'],
      subtitle3: json['subtitle3'],
      tip: json['tip'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'points2': points2,
      'subtitle': subtitle,
      'subtitle3': subtitle3,
      'tip': tip,
    };
  }
}
class MeetingStandardEssentialDocument {
  final List<String> points1;
  final List<String> points2;
  final String title;
  final String title1;
  final String title2;

  MeetingStandardEssentialDocument({
    required this.points1,
    required this.points2,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory MeetingStandardEssentialDocument.fromJson(Map<String, dynamic> json) {
    return MeetingStandardEssentialDocument(
      points1: List<String>.from(json['points1']),
      points2: List<String>.from(json['points2']),
      title: json['title'],
      title1: json['title1'],
      title2: json['title2'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'points1': points1,
      'points2': points2,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
class MotTest {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String title;

  MotTest({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.title,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory MotTest.fromJson(Map<String, dynamic> json) {
    return MotTest(
      image: json['image'],
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      subtitle2: json['subtitle2'],
      title: json['title'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}
class RegisteringAndOwningCar {
  final String image;
  final List<String> points;
  final String title;

  RegisteringAndOwningCar({
    required this.image,
    required this.points,
    required this.title,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory RegisteringAndOwningCar.fromJson(Map<String, dynamic> json) {
    return RegisteringAndOwningCar(
      image: json['image'],
      points: List<String>.from(json['points']),
      title: json['title'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
class ThinkAboutEssentialDocument {
  final List<String> points;
  final String title;

  ThinkAboutEssentialDocument({
    required this.points,
    required this.title,
  });

  // Factory constructor to create an instance from a map (e.g., from Firestore)
  factory ThinkAboutEssentialDocument.fromJson(Map<String, dynamic> json) {
    return ThinkAboutEssentialDocument(
      points: List<String>.from(json['points']),
      title: json['title'],
    );
  }

  // Method to convert the instance back to a map (useful for Firestore or API)
  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'title': title,
    };
  }
}
class DrivingLicence {
  final String? image;
  final List<String>? points;
  final List<String>? points1;
  final String? subtitle;
  final String? tip;
  final String? tip1;
  final String? title;

  DrivingLicence({
    this.image,
    this.points,
    this.points1,
    this.subtitle,
    this.tip,
    this.tip1,
    this.title,
  });

  // Factory method to create an instance from a JSON Map
  factory DrivingLicence.fromJson(Map<String, dynamic> json) {
    return DrivingLicence(
      image: json['image'] as String?,
      points: (json['points'] as List<dynamic>?)?.map((point) => point as String).toList(),
      points1: (json['points1'] as List<dynamic>?)?.map((point) => point as String).toList(),
      subtitle: json['subtitle'] as String?,
      tip: json['tip'] as String?,
      tip1: json['tip1'] as String?,
      title: json['title'] as String?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'points1': points1,
      'subtitle': subtitle,
      'tip': tip,
      'tip1': tip1,
      'title': title,
    };
  }
}

