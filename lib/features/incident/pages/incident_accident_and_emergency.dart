import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';
import 'breakdown.dart';

class IncidentAccidentAndEmergency extends StatefulWidget {
  const IncidentAccidentAndEmergency({super.key});

  @override
  _IncidentAccidentAndEmergencyState createState() =>
      _IncidentAccidentAndEmergencyState();
}

class _IncidentAccidentAndEmergencyState
    extends State<IncidentAccidentAndEmergency> {
  IncidentController? _incidentController;

  @override
  void didChangeDependencies() {
    _incidentController = Provider.of<IncidentController>(context,listen: false);
    _incidentController?.fetchIntroductionIncident("Introduction");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Incident Accident, and Emergency',
            style: GoogleFonts.roboto(
              color: Colors.white
            )),
      ),
      body: Consumer<IncidentController>(
        builder: (context,value,child) {
          final data  = value.introductionIncident;
          if(data ==null)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  createHeadingText(
                    data!.title!,
                    // style: GoogleFonts.roboto(
                    //   fontSize: 24.0,
                    //   fontWeight: FontWeight.bold,
                    //     color: Colors.green
                    // ),
                  ),
                  const SizedBox(height: 16.0),
                  // Paragraph
                  Text(
                    'In this section, you’ll learn about',
                    style: GoogleFonts.roboto(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: buildImage(data.image!),
                   ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                         border: Border.all(color: Colors.green),
                      ),

                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BulletPoint(text: data.points![0]),
                          BulletPoint(text:  data.points![1]),
                          BulletPoint(text:  data.points![2]),
                          BulletPoint(
                              text:  data.points![3]),
                          BulletPoint(
                              text:  data.points![4]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  // Image
            
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>const Breakdowns()),
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

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(Icons.brightness_1, size: 8.0),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.roboto(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
