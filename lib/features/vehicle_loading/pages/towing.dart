import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/saving_fuel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class TowingVehicle extends StatefulWidget {
  const TowingVehicle({super.key});

  @override
  State<TowingVehicle> createState() => _TowingVehicleState();
}

class _TowingVehicleState extends State<TowingVehicle> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
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
        title: const Text(
          "Towing",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<VehicleLoadingProvider>(
        builder: (BuildContext context, value, Widget? child) {
          final data = value.towingVehicleLoading;
          print(data);
          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }

          final tip = data.tips;
          print("List");
          print(tip.toList());
          final ans = data.answers;
          final correctAnswer = data.correct;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createHeadingText(data.title),
                  buildImage(data.image),
                  createAutoSizeText(data.subtitle1),
                  createAutoSizeText(data.subtitle2),
                  createAutoSizeText(data.subtitle3),
                  AutoSizeText(
                    " Q : ${data.question}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                  Column(
                    children: ans!.entries.map((entry) {
                      String answerKey = entry.key; // Key is a string
                      String answerText = entry.value;
                      int answerIndex = int.tryParse(answerKey) ?? 0;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //    color: isCorrect ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: ListTile(
                            tileColor: selectedAnswerIndex != null
                                ? answerText == correctAnswer
                                    ? Colors.green.withOpacity(0.7)
                                    : selectedAnswerIndex == answerIndex
                                        ? Colors.red.withOpacity(0.7)
                                        : null
                                : null,
                            leading: Text(answerKey),
                            title: Text(answerText),
                            trailing: selectedAnswerIndex != null
                                ? answerText == correctAnswer
                                    ? Icon(Icons.check, color: Colors.green)
                                    : selectedAnswerIndex == answerIndex
                                        ? Icon(Icons.close, color: Colors.red)
                                        : null
                                : null,
                            onTap: selectedAnswerIndex == null
                                ? () {
                                    setState(() {
                                      selectedAnswerIndex = answerIndex;
                                      isCorrect = answerText == correctAnswer;
                                      isSelect = true;
                                    });
                                  }
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const AutoSizeText(
                    "Answers",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Opacity(
                    opacity: isSelect ? 1 : 0,
                      child: AutoSizeText(data.correct)),
                  Gap(10),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTipWidget(data.tips[4]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SavingFuelVehicleLoading()),
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
