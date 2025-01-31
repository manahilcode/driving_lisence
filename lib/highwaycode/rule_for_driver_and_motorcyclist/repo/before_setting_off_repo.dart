import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/before_setting_off_model.dart';

class BeforeSettingOffRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<BeforeSettingOffModel> fetchBeforeSettingOffData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_drivers_and_motorcyclists")
          .doc('Before setting off')
          .get();

      if (docSnapshot.exists) {
        return BeforeSettingOffModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
