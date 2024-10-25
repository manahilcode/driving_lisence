import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/road_and_traffic_sign/pages/road_lanes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class SignalGivenByPoliceDrivers extends StatefulWidget {
  const SignalGivenByPoliceDrivers({super.key});

  @override
  State<SignalGivenByPoliceDrivers> createState() =>
      _SignalGivenByPoliceDriversState();
}

class _SignalGivenByPoliceDriversState
    extends State<SignalGivenByPoliceDrivers> {
  RoadSignController? _roadSignController;
  @override
  void didChangeDependencies() {
    _roadSignController =
        Provider.of<RoadSignController>(context, listen: false);
    _roadSignController?.fetchDriverSignal("signal_given_by_driver");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signal given by driver and police",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<RoadSignController>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.driverSignal;

          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final ans = data.answers;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title!),
                  buildImage(data.image1),
                  createAutoSizeText(data.subtitle),
                  createAutoSizeText(data.subtitle2),
                  AutoSizeText(
                    "Q : ${data.question}",
                    style:
                        TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: ans!.entries.map((entry) {
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

                  AutoSizeText("Answer",style: TextStyle(color: Colors.green),),
                  createAutoSizeText(data.correctAnswer),
                  buildTipWidget(data.tip),

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
                          buildImage(data.image2),
                          createAutoSizeText(data.subtitle3),

                        ],
                      ),
                    ),
                  ),

                  createAutoSizeText(data.subtitle4),
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
                          buildImage(data.image3),
                          createAutoSizeText(data.subtitle5),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Route newRoute = MaterialPageRoute(builder: (context) => const RoadLanes());

                      Navigator.pushAndRemoveUntil(
                        context,
                        newRoute,
                            (Route<dynamic> route) => false, // Removes all previous routes
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
      ),
    );
  }
}
