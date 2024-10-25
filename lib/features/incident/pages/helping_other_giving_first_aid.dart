import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/pages/Reporting_an_incident.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class HelpingOtherGivingFirstAid extends StatefulWidget {
  const HelpingOtherGivingFirstAid({super.key});

  @override
  State<HelpingOtherGivingFirstAid> createState() => _HelpingOtherGivingFirstAidState();
}

class _HelpingOtherGivingFirstAidState extends State<HelpingOtherGivingFirstAid> {
  IncidentController? _incidentController;

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    _incidentController = Provider.of<IncidentController>(context,listen: false);
    _incidentController?.fetchHelpOtherGivingAid("help_others_and_giving_aid");
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Helping Other And Giving First Aid",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IncidentController>(
        builder: (context,value,child) {
          final data = value.helpOtherGivingAid;
          if(data == null)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  createHeadingText(data.title!),
                  const Gap(10),
                  buildImage(data.image!),
                  createAutoSizeText(data.subtitle!),
                  const Gap(10),
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
                          buildBulletText(data.points![0]),
                          buildBulletText(data.points![1]),
                          buildBulletText(data.points![2]),
                          buildBulletText(data.points![3]),
                          buildBulletText(data.points![4]),
                          buildBulletText(data.points![5]),
                          buildBulletText(data.points![6]),
                          buildBulletText(data.points![7]),
                          buildBulletText(data.points![8]),
                          buildBulletText(data.points![9]),
                          buildBulletText(data.points![10]),
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
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
                          buildImage(data.image1!),
                          createAutoSizeText(data.imageCaption1!),

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
                          buildImage(data.image2!),
                          createAutoSizeText(data.imageCaption2!),

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
                          buildImage(data.image3!),
                          createAutoSizeText(data.imageCaption3!),

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
                          buildImage(data.image4!),
                          createAutoSizeText(data.imageCaption4!),

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
                          buildImage(data.image5!),
                          createAutoSizeText(data.imageCaption5!),

                        ],
                      ),
                    ),
                  ),






                const Gap(10),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const ReportingAnIncident()),
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
