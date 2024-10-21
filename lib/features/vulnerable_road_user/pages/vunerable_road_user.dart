import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/vunerable_road_user_test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class VulnerableRoadUser extends StatefulWidget {
  const VulnerableRoadUser({super.key});

  @override
  State<VulnerableRoadUser> createState() => _VulnerableRoadUserState();
}

class _VulnerableRoadUserState extends State<VulnerableRoadUser> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Vulnerable road users",style: GoogleFonts.roboto(
        color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,

      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'As a car driver, you’ll share the road with many other road users. Some of these are more vulnerable than you, because of their',
              style: TextStyle(fontSize: 16),
              minFontSize: 10,
              stepGranularity: 10,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText("${bullet} inexperience or lack of judgement",
                  style: TextStyle(fontSize: 10),
                ),
                AutoSizeText("${bullet} size",
                  style: TextStyle(fontSize: 10),
                ),
                AutoSizeText("${bullet} speed",
                  style: TextStyle(fontSize: 10),
                ),
                AutoSizeText("${bullet} unpredictable behaviour.",
                  style: TextStyle(fontSize: 10),
                ),

              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const AutoSizeText(
              'In a car you’re also surrounded by bodywork that’s designed to protect you in a crash. Among the most vulnerable road users are',
              // style: TextStyle(fontSize: 40),
              style: TextStyle(fontSize: 16),
              minFontSize: 10,
              stepGranularity: 10,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText("${bullet} pedestrians – especially children and older people",
                  style: TextStyle(fontSize: 10),
                ),
                AutoSizeText("${bullet} cyclists",
                  style: TextStyle(fontSize: 10),
                ),
                AutoSizeText("${bullet} motorcyclists",
                  style: TextStyle(fontSize: 10),
                ),
                AutoSizeText("${bullet} horse riders.",
                  style: TextStyle(fontSize: 10),
                ),

              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const AutoSizeText(
                style: TextStyle(fontSize: 16),
                "Remember to treat all road users with courtesy and consideration. It’s particularly important to be patient when there are children, older or disabled people using the road."),
            const SizedBox(
              height: 10,
            ),
            const AutoSizeText(
                style: TextStyle(fontSize: 16),
                "The most vulnerable drivers and riders are those who are still learning, inexperienced or older. Keep calm and make allowances for them."),

            Spacer(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the next tip or page
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VunerableRoadUserTest(),
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
        ),
      ),
    );
  }
}
