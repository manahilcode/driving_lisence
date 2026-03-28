import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/allertness/pages/observation_and_awareness1.dart';
import 'package:driving_lisence/features/allertness/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ObservationAwarness extends StatefulWidget {
  const ObservationAwarness({super.key});

  @override
  State<ObservationAwarness> createState() => _ObservationAwarnessState();
}

class _ObservationAwarnessState extends State<ObservationAwarness> {

  AlertController? _alertController;

  @override
  void didChangeDependencies() {
    _alertController=Provider.of<AlertController>(context,listen: false);
    _alertController?.fetchObservationAwareness();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Observation Awareness",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<AlertController>(builder: (BuildContext context, value, Widget? child) {
        final data = value.observationAwareness;
        if(data == null)
          {
            return LoadingScreen();
          }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              createHeadingText(data.title),
              Gap(10),
              createAutoSizeText(data.subtitle),
              Gap(10),
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
                      buildBulletText(data.points[3]),
                      buildBulletText(data.points[4]),
                      buildBulletText(data.points[5]),
                      buildBulletText(data.points[6]),
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
                        builder: (context) => const ObservationAwarness1()),
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
        );
      },),
    );
  }
}
