import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/meeting_the_standard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';
class SavingFuelVehicleLoading extends StatefulWidget {
  const SavingFuelVehicleLoading({super.key});

  @override
  State<SavingFuelVehicleLoading> createState() => _SavingFuelVehicleLoadingState();
}

class _SavingFuelVehicleLoadingState extends State<SavingFuelVehicleLoading> {
  VehicleLoadingProvider? _loadingProvider;
  @override
  void didChangeDependencies() {
    _loadingProvider = Provider.of<VehicleLoadingProvider>(context,listen: false);
    _loadingProvider?.fetchSavingFuelVehicleLoading();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Fuel",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<VehicleLoadingProvider>(builder: (BuildContext context, value, Widget? child) {
        final data = value.savingFuelVehicleLoading;
        if(data == null)
        {
          return Center(child: LoadingScreen(),);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              createHeadingText(data.title),
              buildImage(data.image),
              createAutoSizeText(data.subtitle),
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
