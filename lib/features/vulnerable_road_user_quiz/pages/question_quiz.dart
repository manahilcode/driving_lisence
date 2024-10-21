import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionQuiz extends StatefulWidget {
  const QuestionQuiz({super.key});

  @override
  State<QuestionQuiz> createState() => _QuestionQuizState();
}

class _QuestionQuizState extends State<QuestionQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions 1 / 66"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "Why should these road markings be kept clear?",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      title:
                          Text("To allow children to be dropped off at school"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("To allow teachers to parkl"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      title:
                          Text("To allow children to be picked up after school"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                          "To allow children to see and be seen when they're crossing the road"),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
