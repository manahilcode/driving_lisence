import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/thing_discuss.dart';

class ThingsDicussScreenEssentailDoc extends StatefulWidget {
  const ThingsDicussScreenEssentailDoc({super.key});

  @override
  State<ThingsDicussScreenEssentailDoc> createState() => _ThingsDicussScreenEssentailDocState();
}

class _ThingsDicussScreenEssentailDocState extends State<ThingsDicussScreenEssentailDoc> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ThingDiscussProviderDocument>(context, listen: false);
      provider.fetchDriverInfo();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "Alertness",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),

      body: Consumer<ThingDiscussProviderDocument>(
          builder: (context,provider,child) {
            final data = provider.driverInfo;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              children: [
                createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                createAutoSizeText(data.title1),
                Column(
                  children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                ),
                createAutoSizeText(data.title2),
                Column(
                  children: data.points1.map((e)=>buildBulletText(e.toString())).toList(),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Othertype6(), // Replace with your next screen
                      //   ),
                      // );
                    },
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
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
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
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
            );
          }
      ),
    );
  }
}
