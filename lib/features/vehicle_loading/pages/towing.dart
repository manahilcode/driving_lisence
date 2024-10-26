import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/saving_fuel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class TowingVehicle extends StatefulWidget {
  const TowingVehicle({super.key});

  @override
  State<TowingVehicle> createState() => _TowingVehicleState();
}

class _TowingVehicleState extends State<TowingVehicle> {
  VehicleLoadingProvider? _loadingProvider;
  @override
  void didChangeDependencies() {
    _loadingProvider =
        Provider.of<VehicleLoadingProvider>(context, listen: false);
    _loadingProvider?.fetchTowingVehicleLoading();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Towing"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<VehicleLoadingProvider>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.towingVehicleLoading;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final ans = data.answers;
          return Column(
            children: [
              createHeadingText(data.title),
              buildImage(data.image),
              createAutoSizeText(data.subtitle1),
              createAutoSizeText(data.subtitle2),
              createAutoSizeText(data.subtitle3),
              AutoSizeText(" Q : ${data.question}"),
              Column(
                children: ans!.entries.map((entry) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(entry.key.toString()),
                      ),
                      title: Text(entry.value),
                    ),
                  );
                }).toList(),
              ),
              AutoSizeText("Answers"),
              AutoSizeText(data.correct),
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
                      buildImage(data.image1),
                      createAutoSizeText(data.imageCaption1),
                    ],
                  ),
                ),
              ),
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
                      createAutoSizeText(data.imageCaption2),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildTipWidget(data.tips[0]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildTipWidget(data.tips[1]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildTipWidget(data.tips[2]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildTipWidget(data.tips[3]),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SavingFuelVehicleLoading()),
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
