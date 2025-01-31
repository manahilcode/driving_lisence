import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/apply_licence.dart';
import '../viewmodel/about_theory_controller.dart';
import 'apply_licence.dart';

class LorryAboutTheoryscreen extends StatefulWidget {
  const LorryAboutTheoryscreen({super.key});

  @override
  State<LorryAboutTheoryscreen> createState() => _LorryAboutTheoryscreenState();
}

class _LorryAboutTheoryscreenState extends State<LorryAboutTheoryscreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<GettingInfoProvider>(context, listen: false);
      provider.fetchInfo("About_the_theory_test");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "About Theory", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<GettingInfoProvider>(
        builder: (context,provider,child){
          final data = provider.gettingInfo;
          if(data == null){
            return const Center(child: LoadingScreen());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  createAutoSizeText(data.text ?? ""),
                  createAutoSizeText(data.text1 ?? ""),
                  // create button
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        //   Navigate to the next tip or page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ApplyLicenceScreen(),
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
            ),
          );
        }
      ),
    );
  }
}
