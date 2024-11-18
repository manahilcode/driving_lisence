import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/allertness/pages/stay_focus1.dart';
import 'package:driving_lisence/features/allertness/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StayFocused extends StatefulWidget {
  const StayFocused({super.key});

  @override
  State<StayFocused> createState() => _StayFocusedState();
}

class _StayFocusedState extends State<StayFocused> {
  AlertController? _alertController;

  @override
  void didChangeDependencies() {
    _alertController = Provider.of<AlertController>(context, listen: false);
    _alertController?.fetchStayFocus();
    _alertController?.fetchAvoidingTiredness();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stay Focus ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<AlertController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.stayfocus;
          final data1 = value.avoidingTiredness;

          if (data1 == null || data == null) {
            return LoadingScreen();
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title),
                  createAutoSizeText(data.subtitle),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          buildBulletText(data.points[0]),
                          buildBulletText(data.points[1]),
                          buildBulletText(data.points[2]),
                        ],
                      ),


                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: createHeadingText(data1.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildImage(data1.image),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTipWidget(data1.tip),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          buildBulletText(data1.points[0]),
                          buildBulletText(data1.points[1]),
                          buildBulletText(data1.points[2]),
                          buildBulletText(data1.points[3]),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StayFocused1()),
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
                              offset: const Offset(0, 3),
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
      ),
    );
  }
}
