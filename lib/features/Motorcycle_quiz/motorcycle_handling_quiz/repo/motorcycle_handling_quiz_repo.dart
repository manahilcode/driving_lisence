
import 'package:cloud_firestore/cloud_firestore.dart';
import '';
import '../../Alerness_quiz/model/alernessmodel.dart';


class MotorcycleMotorCycleHandlingQuizRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to fetch a list of QuizModel
  Future<List<QuizQuestion>> getQuizModels() async {
    List<QuizQuestion> quizList = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection("motorcycle_motorcycle_handling_quiz")
          .get();
      for (var doc in querySnapshot.docs) {
        QuizQuestion quiz = QuizQuestion.fromJson(doc.data() as Map<String, dynamic>);
        quizList.add(quiz);
      }
    } catch (e) {
      print('Error fetching QuizModels: $e');
    }
    return quizList;
  }
}