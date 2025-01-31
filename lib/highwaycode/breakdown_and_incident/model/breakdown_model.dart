class BreakdownPointModel {

  final List<String> points;

  BreakdownPointModel({required this.points});

  // Factory method to create an instance from a JSON object
  factory BreakdownPointModel.fromJson(Map<String, dynamic> json) {
    return BreakdownPointModel(

      points: json['description'] as List<String>,
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'description': points,
    };
  }
}
