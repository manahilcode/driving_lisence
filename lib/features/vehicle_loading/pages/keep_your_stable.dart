import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/passenger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class KeepYourStable extends StatefulWidget {
  const KeepYourStable({super.key});

  @override
  State<KeepYourStable> createState() => _KeepYourStableState();
}

class _KeepYourStableState extends State<KeepYourStable> {
  VehicleLoadingProvider? _loadingProvider;
  @override
  void didChangeDependencies() {
    _loadingProvider =
        Provider.of<VehicleLoadingProvider>(context, listen: false);
    _loadingProvider?.fetchVehicleKeepStable();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("keep your car stable"),
        backgroundColor: Colors.green,
      ),
      body: Consumer<VehicleLoadingProvider>(
        builder: (context,value,child) {
          final data  = value.vehicleKeepStable;
          if(data == null)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title),
                  Gap(10),
                  createAutoSizeText(
                      data.subtitle),
                  Gap(10),
                  buildImage(data.image),

                  Gap(10),
                  createAutoSizeText(
                      data.points[0]),
                  Gap(10),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText( data.points[1]),
                        buildBulletText( data.points[2]),
                      ],
                    ),
                  ),
                  Gap(10),
                  createAutoSizeText(
                      data.points[3]),
                  Gap(10),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText( data.points[4]),
                        buildBulletText(
                            data.points[5]),
                        buildBulletText(
                            data.points[6]),
                      ],
                    ),
                  ),
                  Gap(10),
                  createAutoSizeText(data.points[7]),
                  Gap(10),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data.points[8]),
                        buildBulletText( data.points[9]),

                      ],
                    ),
                  ),
                  createAutoSizeText(data.subtitle2),
                  Gap(10),
                  Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTipWidget(data.tip![0]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTipWidget(data.tip![1]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTipWidget(data.tip![2]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTipWidget(data.tip![2]),
                          ),

                        ],
                      )),
                  // Container(
                  //   padding: const EdgeInsets.all(12.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.green.withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: Colors.green),
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       buildBulletText("when you’re carrying a heavy load"),
                  //       buildBulletText("if you’re driving for a long distance on a dual carriageway or motorway at the speed limit for these roads."),
                  //
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const PassengerVehicleLoading()),
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
        }
      ),
    );
  }
}
