import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/keep_up_date_provider.dart';

class KeepUpDateScreen extends StatefulWidget {
  const KeepUpDateScreen({super.key});

  @override
  State<KeepUpDateScreen> createState() => _KeepUpDateScreenState();
}

class _KeepUpDateScreenState extends State<KeepUpDateScreen> {
  @override
  void initState() {
    final trafficSignProvider = Provider.of<KeepUpToDateProvider>(context, listen: false);
    trafficSignProvider.fetchKeepUpToDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A clean AppBar title.
      appBar: CustomAppBar(title: "Keep up to date", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => TrafficSignScreenMain(),
          ),
              (Route<dynamic> route) =>
          false, // Removes all previous routes
        );
      }),

      // appBar: AppBar(
      //   title: const Text("Keep Up To Date"),
      // ),
      body: Consumer<KeepUpToDateProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }

          if (provider.keepUpToDate == null) {
            return const Center(child: Text("No data found."));
          }

          final data = provider.keepUpToDate!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the main text.
                Text(
                  data.text,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                //const Divider(thickness: 2),
                // Display the list of points.
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.points.length,
                  separatorBuilder: (context, index) =>  Container(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: buildBulletText(
                        data.points[index],
                      ),
                    );
                  },
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigate to the next tip or page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrafficSignScreenMain(),
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
          );
        },
      ),
    );
  }
}
