import 'package:flutter/material.dart';

import '../model/seeing_As_being_seen.dart';
import '../repo/seeing_is_being_seen_repo.dart';

class SeeingAndBeingSeenNotifier extends ChangeNotifier {
  SeeingAndBeingSeen? _data;

  SeeingAndBeingSeen? get data => _data;

  Future<void> fetchData() async {
    try {
      SeeingAndBeingSeenRepository repository = SeeingAndBeingSeenRepository();
      _data = await repository.getSeeingAndBeingSeenData();
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
