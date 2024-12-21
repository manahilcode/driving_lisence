import 'package:flutter/material.dart';

import '../model/skidding_info_model.dart';
import '../repo/skidding_info_repo.dart';

class SkiddingInfoNotifier extends ChangeNotifier {
  SkiddingInfo? _data;

  SkiddingInfo? get data => _data;

  Future<void> fetchSkiddingInfoData() async {
    try {
      SkiddingInfoRepository repository = SkiddingInfoRepository();
      _data = await repository.getSkiddingInfoData();
      notifyListeners();
    } catch (e) {
      print("Error fetching Skidding Info data: $e");
    }
  }
}
