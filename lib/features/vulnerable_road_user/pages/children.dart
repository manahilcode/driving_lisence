import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'older_disabled_pedistrains.dart';

class Children extends StatefulWidget {
  const Children({super.key});

  @override
  State<Children> createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Children",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
                "Children are particularly vulnerable as road users because they can be unpredictable. They’re less likely than other pedestrians to look before stepping into the road."),
            const AutoSizeText(
              "Drive carefully near schools",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/L.png",
                  height: 50,
                  width: 50,
                ),
                const Expanded(
                  child: AutoSizeText(
                      "Don’t wait or park on yellow zigzag lines outside a school. A clear view of the crossing area outside the school is needed by"
                      " drivers and riders on the road"
                      "pedestrians on the pavement"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: AutoSizeText(
                      "There may be flashing amber lights under a school warning sign, to show that children are likely to be crossing the road on their way to or from school. Slow down until you’re clear of the area"),
                ),
                Image.asset(
                  "assets/L.png",
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: AutoSizeText(
                      "Be prepared for a school crossing patrol to stop the traffic by stepping out into the road with a stop sign. You MUST obey the stop signal given by a school crossing patrol."),
                ),
                Image.asset(
                  "assets/L.png",
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  //   Navigate to the next tip or page
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OlderDisabledPedistrains(),
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
