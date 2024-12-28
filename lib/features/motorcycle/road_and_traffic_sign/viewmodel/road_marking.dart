import 'package:flutter/foundation.dart';

import '../model/road_marking.dart';
import '../repo/road_marking.dart';

class RoadMarkingsNotifier extends ChangeNotifier {
  RoadMarkingsData? _roadMarkingsData;

  // Getter to access the RoadMarkingsData
  RoadMarkingsData? get roadMarkingsData => _roadMarkingsData;

  // Fetch the data from the repository and notify listeners
  Future<void> fetchRoadMarkingsData(String col , String doc) async {
    try {
      // Optionally, you could call an API or load data from local storage
      var repository = RoadMarkingsRepository();
      _roadMarkingsData = await repository.fetchRoadMarkingsData(col,doc);

      // Notify listeners about the change
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

// Optionally, you can add more methods to modify the data as needed
}
