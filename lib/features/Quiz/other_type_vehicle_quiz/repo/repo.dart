import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class OtherTypeVehicleQuizRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to fetch a list of QuizModel
  Future<List<QuizModel>> getQuizModels() async {
    List<QuizModel> quizList = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('other_type_vehicle_quiz')
          .get();
      for (var doc in querySnapshot.docs) {
        QuizModel quiz = QuizModel.fromJson(doc.data() as Map<String, dynamic>);
        quizList.add(quiz);
      }
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }
    return quizList;
  }
}