import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../repo/attitudeRepo.dart';

class Attitude extends ChangeNotifier {
  final AttitudeRepo _attitudeRepo = AttitudeRepo();

  Future<Map<String, dynamic>?>? attitude1() async {
    final data = await _attitudeRepo.fetchTip();
    // Log the data once the future is complete
    if (data != null) {
      return data;
      // log("Fetched Data: $data");
    } else {
      log("No data found for attitudeNo:");
    }
    return null;
  }
}
