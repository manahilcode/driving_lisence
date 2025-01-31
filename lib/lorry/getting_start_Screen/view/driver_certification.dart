import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/driver_certification_controller.dart';
import 'medical_requirement.dart';

class DriverCertificationScreen extends StatefulWidget {
  const DriverCertificationScreen({super.key});

  @override
  State<DriverCertificationScreen> createState() => _DriverCertificationScreenState();
}

class _DriverCertificationScreenState extends State<DriverCertificationScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<DriverCertificationControllerProvider>(context, listen: false);
      provider.fetchInfo("Driver_Certificate_of_Professional_Competence");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Driver Certification", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<DriverCertificationControllerProvider>(
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
                            builder: (context) =>  MedicalRequirementScreen(),
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
