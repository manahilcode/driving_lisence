import 'package:driving_lisence/category.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class ThingDiscussPracticeEssentialDocument extends StatefulWidget {
  const ThingDiscussPracticeEssentialDocument({super.key});

  @override
  State<ThingDiscussPracticeEssentialDocument> createState() => _ThingDiscussPracticeEssentialDocumentState();
}

class _ThingDiscussPracticeEssentialDocumentState extends State<ThingDiscussPracticeEssentialDocument> {
  EssentialDocumentsController? _essentialDocumentsController;

  @override
  void didChangeDependencies() {
    _essentialDocumentsController = Provider.of<EssentialDocumentsController>(context,listen: false);
    _essentialDocumentsController?.fetchDiscussInstructor("discuss_with_instructor");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Things to Discuss with Instructor",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<EssentialDocumentsController>(builder: (BuildContext context, value, Widget? child) {
        final data = value.discussInstructor;
        if(data == null)
        {
          return LoadingScreen();
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            children: [
             createHeadingText(data.title),
              createAutoSizeText(data.subtitle),
              createHeadingText(data.title2),
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
                      buildBulletText(data.point1[0]),
                      buildBulletText(data.point1[1]),
                      buildBulletText(data.point1[2]),
                    ],
                  ),
                ),
              ),
              createHeadingText(data.title3),
              createAutoSizeText(data.subtitle2),
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
                    ],
                  ),
                ),
              ),
               createAutoSizeText(data.title4),
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
                      buildBulletText(data.points3[0]),
                      buildBulletText(data.points3[1]),
                      buildBulletText(data.points3[2]),
                    ],
                  ),
                ),
              ),
          
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(builder: (context) =>  Category());
          
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
