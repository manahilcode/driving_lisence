import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../model/on_the_road.dart';
import '../viewmodel/medical_requirement_controller.dart';
import 'on_the_road.dart';

class MedicalRequirementScreen extends StatefulWidget {
  const MedicalRequirementScreen({super.key});

  @override
  State<MedicalRequirementScreen> createState() => _MedicalRequirementScreenState();
}

class _MedicalRequirementScreenState extends State<MedicalRequirementScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MedicalRequirementControllerProvider>(context, listen: false);
      provider.fetchInfo("Medical_requirements");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Medical Requirement", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<MedicalRequirementControllerProvider>(
          builder: (context,provider,child){
            final data = provider.gettingInfo;

            if(provider.isLoading){
              return Center(child: LoadingScreen());
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  createAutoSizeText(data?.text ?? ""),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        //   Navigate to the next tip or page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  OnTheRoadScreen(),
                          ),
                              (Route<dynamic> route) => false, // Removes all previous routes
                        );
                      },
                      child: Center(
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.symmetric(
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
                                offset: const Offset(0, 3),
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
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
