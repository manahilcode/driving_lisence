// lib/models/road_work_sign.dart
class RoadWorkItem {
  final String title;
  final String imageUrl;

  RoadWorkItem({
    required this.title,
    required this.imageUrl,
  });
}

class RoadWorkSign {
  final List<RoadWorkItem> items;

  RoadWorkSign({required this.items});

  /// Create the model from a Map.
  /// Expects a key "text" which is an array containing alternating title and image URL.
  factory RoadWorkSign.fromMap(Map<String, dynamic> map) {
    List<dynamic> rawList = map['text'] ?? [];
    List<RoadWorkItem> items = [];

    // Loop over the array two items at a time.
    for (int i = 0; i < rawList.length; i += 2) {
      if (i + 1 < rawList.length) {
        items.add(
          RoadWorkItem(
            title: rawList[i].toString(),
            imageUrl: rawList[i + 1].toString(),
          ),
        );
      }
    }
    return RoadWorkSign(items: items);
  }
}
