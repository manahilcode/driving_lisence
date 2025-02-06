
// lib/repositories/sign_giving_orders_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/giving_order_model.dart';

class SignGivingOrdersRepository {
  final FirebaseFirestore firestore;

  SignGivingOrdersRepository({required this.firestore});

  Future<SignGivingOrders> getSignGivingOrders() async {
    // Replace 'your_collection' and 'your_document' with your Firestore IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('Signs giving orders')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }
    return SignGivingOrders.fromMap(doc.data() as Map<String, dynamic>);
  }
}
