import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';
class DiscussParacticeInstructorVehicleLoading extends StatefulWidget {
  const DiscussParacticeInstructorVehicleLoading({super.key});

  @override
  State<DiscussParacticeInstructorVehicleLoading> createState() => _DiscussParacticeInstructorVehicleLoadingState();
}

class _DiscussParacticeInstructorVehicleLoadingState extends State<DiscussParacticeInstructorVehicleLoading> {
  VehicleLoadingProvider? _loadingProvider;
  @override
  void didChangeDependencies() {
    _loadingProvider = Provider.of<VehicleLoadingProvider>(context,listen: false);
    _loadingProvider?.fetchDiscussWithInstructorVehicleLoading();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discuss with Instructor"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<VehicleLoadingProvider>(builder: (BuildContext context, value, Widget? child) {
        final data = value.discussWithInstructorVehicleLoading;
        if(data == null)
        {
          return Center(child: CircularProgressIndicator(),);
        }
        return Column(
          children: [
            createHeadingText(data.title),
            createAutoSizeText(data.subtitle),
            createHeadingText(data.title2),
            Container(

              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  buildBulletText(data.points[0]),
                  buildBulletText(data.points[1]),
                  buildBulletText(data.points[2]),
                ],
              ),
            ),
            createHeadingText(data.title3),
            Container(

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
          ],
        );
      },
      ),
    );
  }
}
