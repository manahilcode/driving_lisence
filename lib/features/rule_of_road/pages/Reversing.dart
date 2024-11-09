import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/rule_of_road/pages/padestrain_crossing.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/pedestrians.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class Reversing extends StatefulWidget {
  const Reversing({super.key});

  @override
  State<Reversing> createState() => _ReversingState();
}

class _ReversingState extends State<Reversing> {
  RuleRoadController? _ruleRoadController;
  @override
  void didChangeDependencies() {
    _ruleRoadController =
        Provider.of<RuleRoadController>(context, listen: false);
    _ruleRoadController?.fetchReversing();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reversing",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Consumer<RuleRoadController>(
      builder: (BuildContext context, value, Widget? child) {
        final data = value.reversingValue;
        ;

        if (data == null) {
          return Center(
              child: LoadingScreen()); // or any placeholder
        }
        final ans = data.answers;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title!),
                buildImage(data.image!),
                createAutoSizeText(data.subtitle!),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data.points![0]),
                        buildBulletText(data.points![1]),
                        buildBulletText(data.points![2]),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                   " Q : ${ data.question!}",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.green),
                  ),
                ),
                Gap(10),
                if (ans != null)
                  Column(
                    children: ans.entries.map((entry) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(entry.key.toString()),
                          ),
                          title: Text(entry.value),
                        ),
                      );
                    }).toList(),
                  ),
                Gap(10),
                createHeadingText("Answer"),
                createAutoSizeText(data.correctAnswer!),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) => const PadestrainCrossingRule());
            
                    Navigator.pushAndRemoveUntil(
                      context,
                      newRoute,
                      (Route<dynamic> route) =>
                          false, // Removes all previous routes
                    );
                  },
                  child: Center(
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
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
                      child: const Center(
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
      },
    ));
  }
}
