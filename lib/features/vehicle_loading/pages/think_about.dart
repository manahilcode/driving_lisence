import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/meeting_the_standard.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';
import 'package:flutter/material.dart';

class ThinkAboutVehicleLoading extends StatefulWidget {
  const ThinkAboutVehicleLoading({super.key});

  @override
  State<ThinkAboutVehicleLoading> createState() => _ThinkAboutVehicleLoadingState();
}

class _ThinkAboutVehicleLoadingState extends State<ThinkAboutVehicleLoading> {
  VehicleLoadingProvider? _loadingProvider;
  @override
  void didChangeDependencies() {
    _loadingProvider = Provider.of<VehicleLoadingProvider>(context,listen: false);
    _loadingProvider?.fetchThinkAboutVehicleLoading();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Think About",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<VehicleLoadingProvider>(builder: (BuildContext context, value, Widget? child) {
        final data = value.thinkAboutVehicleLoading;
        if(data == null)
        {
          return Center(child: CircularProgressIndicator(),);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              createHeadingText(data.title),
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

                      createAutoSizeText(data.points[0]),
                      createAutoSizeText(data.points[1]),
                      createAutoSizeText(data.points[2]),
                      createAutoSizeText(data.points[3]),


                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MeetingstandardVehicleloading()),
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
        );
      },
      ),
    );

  }
}
