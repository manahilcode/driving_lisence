import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/essential_document/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class MeetingStandardEssentailDocumnet extends StatefulWidget {
  const MeetingStandardEssentailDocumnet({super.key});

  @override
  State<MeetingStandardEssentailDocumnet> createState() => _MeetingStandardEssentailDocumnetState();
}

class _MeetingStandardEssentailDocumnetState extends State<MeetingStandardEssentailDocumnet> {
  EssentialDocumentsController? _essentialDocumentsController;

  @override
  void didChangeDependencies() {
    _essentialDocumentsController = Provider.of<EssentialDocumentsController>(context,listen: false);
    _essentialDocumentsController?.fetchMeetingStandardEssential("meeting_the_standard");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Meeting Standard",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<EssentialDocumentsController>(builder: (BuildContext context, value, Widget? child) {
        final data = value.meetingStandardEssential;
        if(data == null)
        {
        return Center(child: CircularProgressIndicator(),);
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            children: [
              createHeadingText(data.title),
              createAutoSizeText(data.title1),
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
                      buildBulletText(data.points1[0]),
                      buildBulletText(data.points1[1]),
          
                      buildBulletText(data.points1[2]),
                      buildBulletText(data.points1[2]),
          
                    ],
                  ),
                ),
              ),
              createAutoSizeText(data.title2),
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
                      buildBulletText(data.points2[0]),
                      buildBulletText(data.points2[1]),
                      buildBulletText(data.points2[2]),
                      buildBulletText(data.points2[3]),
                      buildBulletText(data.points2[4]),
                      buildBulletText(data.points2[5]),
                      buildBulletText(data.points2[6]),
          
          
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(builder: (context) =>  const ThinkAboutEssentialDocument());
          
                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                        (Route<dynamic> route) => false, // Removes all previous routes
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

      },),
    );
  }
}
