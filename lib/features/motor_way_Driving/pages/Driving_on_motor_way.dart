import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motor_way_Driving/pages/speed_limit.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';

class DrivingOnMotorWay extends StatefulWidget {
  const DrivingOnMotorWay({super.key});

  @override
  State<DrivingOnMotorWay> createState() => _DrivingOnMotorWayState();
}

class _DrivingOnMotorWayState extends State<DrivingOnMotorWay> {
  Controller? _controller;
  @override
  void didChangeDependencies() async{
   //  _controller  = Provider.of<Controller>(context,listen: false);
   // await _controller?.fetchDrivingOnMotorwayData();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    _controller  = Provider.of<Controller>(context,listen: false);
     _controller?.fetchDrivingOnMotorwayData();
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Driving On Motor Way"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<Controller>(builder: (BuildContext context, value, Widget? child) {
        final data = value.drivingOnMotorway;
        if(data == null)
          {
            return LoadingScreen();
          }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
               createHeadingText("Driving On Motor Way"),
                 createAutoSizeText(data?.points[0] ?? ""),
                Container(
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
                      buildBulletText(data?.points[1]?? ""),
                      buildBulletText(data?.points[2]?? ""),
            
                    ],
                  ),
                ),
                ),
            
            createAutoSizeText(data?.subtitle ?? ""),
                buildImage(data?.image ?? ""),
                createAutoSizeText(data?.subtitle2 ?? ""),
                 buildTipWidget(data?.subtitle3 ?? ""),
                createAutoSizeText(data?.subtitle4 ??""),
                createAutoSizeText(data?.subtitle5 ??""),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(
                        builder: (context) => const SpeedLimit());

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

      },)
    );
  }
}
