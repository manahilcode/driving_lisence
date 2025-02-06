class BreakdownPointModel {

   List points;

  BreakdownPointModel({required this.points});

  // Factory method to create an instance from a JSON object
  factory BreakdownPointModel.fromJson(Map<String, dynamic> json) {
    return BreakdownPointModel(
      points: List<String>.from(json['points']  ?? <String>[]),
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'points': points,
    };
  }
}