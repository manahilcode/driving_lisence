class BreakdownIncident {
  final String? image1;
  final String? image2;
  final String? image3;
  final List<String>? points;
  final List<String>? points2;
  final List<String>? points3;
  final String? subtitle;
  final String? subtitle2;
  final String? subtitle3;
  final String? subtitle4;
  final String? tip;
  final String? tip2;
  final String? title;

  BreakdownIncident({
    this.image1,
    this.image2,
    this.image3,
    this.points,
    this.points2,
    this.points3,
    this.subtitle,
    this.subtitle2,
    this.subtitle3,
    this.subtitle4,
    this.tip,
    this.tip2,
    this.title,
  });

  factory BreakdownIncident.fromJson(Map<String, dynamic> json) {
    return BreakdownIncident(
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      points: List<String>.from(json['points'] ?? []),
      points2: List<String>.from(json['points2'] ?? []),
      points3: List<String>.from(json['points3'] ?? []),
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      subtitle3: json['subtitle3'] as String?,
      subtitle4: json['subtitle4'] as String?,
      tip: json['tip'] as String?,
      tip2: json['tip2'] as String?,
      title: json['title'] as String?,
    );
  }
}
class IntroductionIncident {
  final String? image;
  final List<String>? points;
  final String? title;

  IntroductionIncident({
    this.image,
    this.points,
    this.title,
  });

  factory IntroductionIncident.fromJson(Map<String, dynamic> json) {
    return IntroductionIncident(
      image: json['image'] as String?,
      points: List<String>.from(json['points'] ?? []),
      title: json['title'] as String?,
    );
  }
}
class DiscussWithInstructorIncident {
  final List<String>? points1;
  final List<String>? points2;
  final String? subtitle;
  final String? subtitle1;
  final String? title;
  final String? title2;
  final String? title3;

  DiscussWithInstructorIncident({
    this.points1,
    this.points2,
    this.subtitle,
    this.subtitle1,
    this.title,
    this.title2,
    this.title3,
  });

  factory DiscussWithInstructorIncident.fromJson(Map<String, dynamic> json) {
    return DiscussWithInstructorIncident(
      points1: List<String>.from(json['points1'] ?? []),
      points2: List<String>.from(json['points2'] ?? []),
      subtitle: json['subtitle'] as String?,
      subtitle1: json['subtitle1'] as String?,
      title: json['title'] as String?,
      title2: json['title2'] as String?,
      title3: json['title3'] as String?,
    );
  }
}
class HelpOtherGivingAid {
  final String? image;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String? image6;
  final String? imageCaption1;
  final String? imageCaption2;
  final String? imageCaption3;
  final String? imageCaption4;
  final String? imageCaption5;
  final List<String>? points;
  final String? subtitle;
  final String? title;

  HelpOtherGivingAid({
    this.image,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.image6,
    this.imageCaption1,
    this.imageCaption2,
    this.imageCaption3,
    this.imageCaption4,
    this.imageCaption5,
    this.points,
    this.subtitle,
    this.title,
  });

  factory HelpOtherGivingAid.fromJson(Map<String, dynamic> json) {
    return HelpOtherGivingAid(
      image: json['image'] as String?,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      image4: json['image4'] as String?,
      image5: json['image5'] as String?,
      image6: json['image6'] as String?,
      imageCaption1: json['image_caption1'] as String?,
      imageCaption2: json['image_caption2'] as String?,
      imageCaption3: json['image_caption3'] as String?,
      imageCaption4: json['image_caption4'] as String?,
      imageCaption5: json['image_caption5'] as String?,
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] as String?,
      title: json['title'] as String?,
    );
  }
}
class MeetingStandardIncident {
  final List<String>? points1;
  final List<String>? points2;
  final String? title;
  final String? title1;
  final String? title2;

  MeetingStandardIncident({
    this.points1,
    this.points2,
    this.title,
    this.title1,
    this.title2,
  });

  factory MeetingStandardIncident.fromJson(Map<String, dynamic> json) {
    return MeetingStandardIncident(
      points1: List<String>.from(json['points1'] ?? []),
      points2: List<String>.from(json['points2'] ?? []),
      title: json['title'] as String?,
      title1: json['title1'] as String?,
      title2: json['title2'] as String?,
    );
  }
}
class ReportingIncident {
  final String? image;
  final List<String>? points;
  final String? subtitle;
  final String? subtitle2;
  final String? title;

  ReportingIncident({
    this.image,
    this.points,
    this.subtitle,
    this.subtitle2,
    this.title,
  });

  factory ReportingIncident.fromJson(Map<String, dynamic> json) {
    return ReportingIncident(
      image: json['image'] as String?,
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      title: json['title'] as String?,
    );
  }
}
class SafetyInTunnel {
  final String? image;
  final List<String>? points;
  final List<String>? points2;
  final String? subtitle;
  final String? tip;
  final String? title;

  SafetyInTunnel({
    this.image,
    this.points,
    this.points2,
    this.subtitle,
    this.tip,
    this.title,
  });

  factory SafetyInTunnel.fromJson(Map<String, dynamic> json) {
    return SafetyInTunnel(
      image: json['image'] as String?,
      points: List<String>.from(json['points'] ?? []),
      points2: List<String>.from(json['points2'] ?? []),
      subtitle: json['subtitle'] as String?,
      tip: json['tip'] as String?,
      title: json['title'] as String?,
    );
  }
}
class StoppingInIncident {
  final String? image;
  final List<String>? points;
  final String? subtitle;
  final String? subtitle2;
  final String? title;

  StoppingInIncident({
    this.image,
    this.points,
    this.subtitle,
    this.subtitle2,
    this.title,
  });

  factory StoppingInIncident.fromJson(Map<String, dynamic> json) {
    return StoppingInIncident(
      image: json['image'] as String?,
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      title: json['title'] as String?,
    );
  }
}
class ThinkAboutIncident {
  final List<String>? points;
  final String? title;

  ThinkAboutIncident({
    this.points,
    this.title,
  });

  factory ThinkAboutIncident.fromJson(Map<String, dynamic> json) {
    return ThinkAboutIncident(
      points: List<String>.from(json['points'] ?? []),
      title: json['title'] as String?,
    );
  }
}
class WarningOthersOfBreak {
  final String? image;
  final List<String>? points;
  final String? subtitle;
  final String? tip;
  final String? title;

  WarningOthersOfBreak({
    this.image,
    this.points,
    this.subtitle,
    this.tip,
    this.title,
  });

  factory WarningOthersOfBreak.fromJson(Map<String, dynamic> json) {
    return WarningOthersOfBreak(
      image: json['image'] as String?,
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] as String?,
      tip: json['tip'] as String?,
      title: json['title'] as String?,
    );
  }
}
