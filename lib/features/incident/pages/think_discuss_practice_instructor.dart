import 'package:driving_lisence/category.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/incident/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ThinkDiscussPracticeInstructor extends StatefulWidget {
  const ThinkDiscussPracticeInstructor({super.key});

  @override
  State<ThinkDiscussPracticeInstructor> createState() =>
      _ThinkDiscussPracticeInstructorState();
}

class _ThinkDiscussPracticeInstructorState
    extends State<ThinkDiscussPracticeInstructor> {
  IncidentController? _incidentController;

  @override
  void didChangeDependencies() {
    _incidentController = Provider.of<IncidentController>(context,listen: false);
    _incidentController?.fetchDiscussWithInstructorIncident("discuss_with_instructor");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Things to discuss and practise with your instructor"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<IncidentController>(
        builder: (context,value,child) {
          final data  = value.discussWithInstructorIncident;
          if(data == null)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    createHeadingText(
                        "${data.title}"),
                    const Gap(10),
                    createAutoSizeText(
                        data.subtitle!),
                    const Gap(20),
                    createHeadingText(data.title2!),
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
                            buildBulletText(
                                data.points1![0]),
                            buildBulletText(
                                data.points1![1]),
                            buildBulletText(
                                data.points1![2]),
                            buildBulletText(
                                data.points1![3]),
                            buildBulletText(data.points1![4]),
                            buildBulletText(data.points1![5]),
                            buildBulletText( data.points1![6]),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                    createHeadingText(data.title3!),
                    const Gap(10),
                    createAutoSizeText(
                        data.subtitle1!),
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
                            buildBulletText(data.points2![0]),
                            buildBulletText(
                                data.points2![1]),
                            buildBulletText(data.points2![2]),
                            buildBulletText(
                                data.points2![3]),
                            buildBulletText(data.points2![4]),
                            buildBulletText(data.points2![5]),
                            buildBulletText(
                                data.points2![6]),
                            buildBulletText(data.points2![7]),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                               Category()),
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
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
