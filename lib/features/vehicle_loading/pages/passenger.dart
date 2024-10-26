import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/animals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class PassengerVehicleLoading extends StatefulWidget {
  const PassengerVehicleLoading({super.key});

  @override
  State<PassengerVehicleLoading> createState() =>
      _PassengerVehicleLoadingState();
}

class _PassengerVehicleLoadingState extends State<PassengerVehicleLoading> {
  VehicleLoadingProvider? _loadingProvider;
  @override
  void didChangeDependencies() {
    _loadingProvider =
        Provider.of<VehicleLoadingProvider>(context, listen: false);
    _loadingProvider?.fetchPassengerVehicleLoader();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passenger"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<VehicleLoadingProvider>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.passengerVehicleLoader;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              createHeadingText(data.title),
              createAutoSizeText(data.subtitle),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildImage(data.image1),
                    createAutoSizeText(data.imageCaption1),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildImage(data.image2),
                    createAutoSizeText(data.imageCaption2),
                  ],
                ),
              ),
              buildImage(data.subtitle2),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimalsVehicleLoading()),
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
          );
        },
      ),
    );
  }
}
