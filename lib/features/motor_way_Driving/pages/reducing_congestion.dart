import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motor_way_Driving/pages/lane_marking.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReducingCongestion extends StatefulWidget {
  const ReducingCongestion({super.key});

  @override
  State<ReducingCongestion> createState() => _ReducingCongestionState();
}

class _ReducingCongestionState extends State<ReducingCongestion> {
  Controller? _controller;
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context, listen: false);
    _controller?.fetchReduceCongestionData();
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Reduce Consisted"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
body: Consumer<Controller>(builder: (BuildContext context, value, Widget? child) { 
  final data= value.reduceCongestion;
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          createHeadingText(data?.title ?? ""),
          buildImage(data?.image ?? ""),
          createAutoSizeText(data?.subtitle ?? ""),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: createHeadingText(data?.defTitle1 ?? ""),
          ),
          createAutoSizeText(data?.defSubtitle1 ?? ""),
          createAutoSizeText(data?.subtitle2 ?? ""),
          createHeadingText(data?.defTitle2 ?? ""),
          createAutoSizeText(data?.defSubtitle2 ?? ""),
          createHeadingText(data?.defTitle3 ?? ""),
          createAutoSizeText(data?.defSubtitle3 ?? ""),
          createAutoSizeText(data?.points[0] ?? ""),
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
                  buildBulletText(data?.points[1] ?? ""),
                  buildBulletText(data?.points[2] ?? ""),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Route newRoute = MaterialPageRoute(
                  builder: (context) => const LaneMarking());

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
},),
    );
  }
}
