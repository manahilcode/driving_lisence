import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/incident_accident_and_emergency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/loader.dart';
import '../viewmodel/alertness_provider.dart';

class MotorcycleAlertness extends StatefulWidget {
  const MotorcycleAlertness({super.key});

  @override
  State<MotorcycleAlertness> createState() => _MotorcycleAlertnessState();
}

class _MotorcycleAlertnessState extends State<MotorcycleAlertness> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: "Alertness",
            leadingIcon: Icons.arrow_back,
            onLeadingIconPressed: () {}),
        body: Consumer<AlertnessNotifier>(builder: (context, provider, child) {
          final data = provider.alertnessData;
          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }

          return Column(
            children: [
              createAutoSizeText(data.title),
              createAutoSizeText(data.subtitle),
              buildImage(data.imageUrl),
              Column(
                children: data.points
                    .map((e) => BulletPoint(text: e.toString()))
                    .toList(),
              ),

              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the next screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Othertype6(), // Replace with your next screen
                    //   ),
                    // );
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
          );
        },),
    );
  }
}
