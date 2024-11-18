import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/pedestrians.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/vunerable_road_user_test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';

class VulnerableRoadUser extends StatefulWidget {
  const VulnerableRoadUser({super.key});

  @override
  State<VulnerableRoadUser> createState() => _VulnerableRoadUserState();
}

class _VulnerableRoadUserState extends State<VulnerableRoadUser> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController =
        Provider.of<VulnerableController>(context, listen: false);
    _vulnerableController?.fetchVulnerableRoadUser();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title: Text("Vulnerable road users",
            style: GoogleFonts.roboto(color: Colors.white)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<VulnerableController>(builder: (context, value, child) {
        final data = value.vulnerableRoadUser;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        final ans = data.answers;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createHeadingText(data.title),
                createAutoSizeText(
                  data.subtitle,
                ),
                const SizedBox(
                  height: 10,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildBulletText(
                          data.points[0],
                        ),
                        buildBulletText(data.points[1]),
                        buildBulletText(data.points[2]),
                        buildBulletText(data.points[3]),
                        buildBulletText(data.points[4]),
                        buildBulletText(data.points[5]),
                        buildBulletText(data.points[6]),
                        buildBulletText(data.points[7]),
                        buildBulletText(data.points[8]),
                        buildBulletText(data.points[9]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  " Q : ${data.question}",
                  style: TextStyle(color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: ans!.entries.map((entry) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(entry.key.toString()),
                          ),
                          title: Text(entry.value),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const AutoSizeText(
                    "Answer",
                    style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: createAutoSizeText(data.correct)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next tip or page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PedestriansVulnerable(),
                        ),
                        (Route<dynamic> route) =>
                            false, // Removes all previous routes
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
      }),
    );
  }
}
