import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/lorry/getting_start_Screen/view/preparing_for_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/other_study_controller.dart';

class OtherStudyScreen extends StatefulWidget {
  const OtherStudyScreen({super.key});

  @override
  State<OtherStudyScreen> createState() => _OtherStudyScreenState();
}

class _OtherStudyScreenState extends State<OtherStudyScreen> {
  //Other_study_aids
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<OtherStudyControllerProvider>(context, listen: false);
      provider.fetchInfo("Other_study_aids");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Other Study", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<OtherStudyControllerProvider>(
          builder: (context,provider,child){
            final data = provider.gettingInfo;
            if(provider.isLoading){
              return Center(child: LoadingScreen());
            }

            return Column(
              children: [
                createAutoSizeText(data?.text ?? ""),
                Gap(10),
                createAutoSizeText(data?.text1 ?? ""),
                Gap(10),
                createAutoSizeText(data?.text2 ?? ""),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigate to the next tip or page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreparingForTestScreen(),
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
            );
          }
      ),
    );
  }
}
