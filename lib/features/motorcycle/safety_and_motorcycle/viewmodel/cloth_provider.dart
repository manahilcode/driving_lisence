import 'package:flutter/material.dart';

import '../model/cloth_model.dart';
import '../repo/cloth_Repo.dart';

class ClothNotifier extends ChangeNotifier {
  Cloth? _data;

  Cloth? get data => _data;

  Future<void> fetchData() async {
    try {
      ClothRepository repository = ClothRepository();
      _data = await repository.getClothData();
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
