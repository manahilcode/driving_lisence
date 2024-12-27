import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/observation_awareness_provider.dart';
import 'inticipation.dart';

class ObservationAwarenessScreen extends StatefulWidget {
  const ObservationAwarenessScreen({super.key});

  @override
  State<ObservationAwarenessScreen> createState() => _ObservationAwarenessScreenState();
}

class _ObservationAwarenessScreenState extends State<ObservationAwarenessScreen> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ObservationAwarenessNotifier>(context,listen: false);
      provider.fetchData("motorcycle_alertness", "Observation_and_awareness");
    });
    //motorcycle_alertness
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: CustomAppBar(title: "Observation And Awareness", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),

      body: Consumer<ObservationAwarenessNotifier>(
        builder: (context,provider,child) {
          final data = provider.data;

          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }

          final ans = data?.answers;
          final correctAnswer = data.correctAnswer;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                 children: [
                   createHeadingText(data.title),
                   createAutoSizeText(data.subtitle),
                   buildImage(data.image1),
                   createAutoSizeText(data.subtitle1),
                   Column(
                     children: [
                       createHeadingText(data.definition["title"]!),
                       createAutoSizeText(data.definition["subtitle"]!),
                       createHeadingText(data.definition1["title"]!),
                       createAutoSizeText(data.definition1["subtitle"]!),
                     ],
                   ),

                   buildImage(data.image2),
                   createAutoSizeText(data.subtitle2),
                   Column(
                     children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                   ),
                   createAutoSizeText("Question :"),
                   createAutoSizeText(data.question),
                   Column(
                     children: ans!.asMap().entries.map((entry) {
                       int answerKey = entry.key; // Key is a string
                       String answerText = entry.value;
                       int answerIndex = answerKey ?? 0;

                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           height: 70,
                           decoration: BoxDecoration(
                             //    color: isCorrect ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3),
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(
                               color: Colors.black, // Border color
                               width: 1.0, // Border width
                             ),
                           ),
                           child: ListTile(
                             dense: true,
                             tileColor: selectedAnswerIndex != null
                                 ? answerText == correctAnswer
                                 ? Colors.green.withOpacity(0.7)
                                 : selectedAnswerIndex == answerIndex
                                 ? Colors.red.withOpacity(0.7)
                                 : null
                                 : null,
                             leading: AutoSizeText(answerKey.toString()),
                             title: AutoSizeText(answerText),
                             trailing: selectedAnswerIndex != null
                                 ? answerText == correctAnswer
                                 ? Icon(Icons.check, color: Colors.green)
                                 : selectedAnswerIndex == answerIndex
                                 ? Icon(Icons.close, color: Colors.red)
                                 : null
                                 : null,
                             onTap: selectedAnswerIndex == null
                                 ? () {
                               setState(() {
                                 selectedAnswerIndex = answerIndex;
                                 isCorrect = answerText == correctAnswer;
                                 isSelect = true;
                               });

                             }

                                 : null,
                           ),
                         ),
                       );
                     }).toList(),
                   ),

                   createAutoSizeText("Info"),
                 createAutoSizeText(data.info),

                   Center(
                     child: GestureDetector(
                       onTap: () {
                         // Navigate to the next screen
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => InticipationScreen(), // Replace with your next screen
                           ),
                         );
                       },
                       child: Container(
                         width: 300,
                         padding: EdgeInsets.symmetric(
                           vertical: 15.0,
                           horizontal: 30.0,
                         ),
                         decoration: BoxDecoration(
                           color: Colors.green,
                           borderRadius: BorderRadius.circular(10.0),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                               spreadRadius: 2,
                               blurRadius: 5,
                               offset: Offset(0, 3),
                             ),
                           ],
                         ),
                         child: Center(
                           child: Text(
                             "Next",
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 18.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
              ),
            ),
          );
        }
      ),
    );
  }
}
