import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';
import 'children.dart';

class PedestriansVulnerable extends StatefulWidget {
  const PedestriansVulnerable({super.key});

  @override
  State<PedestriansVulnerable> createState() => _PedestriansVulnerableState();
}

class _PedestriansVulnerableState extends State<PedestriansVulnerable> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController =
        Provider.of<VulnerableController>(context, listen: false);
    _vulnerableController?.fetchPedestrianVulnerableRoad();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Pedestrians", style: GoogleFonts.roboto(color: Colors.white)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<VulnerableController>(builder: (context, value, child) {
        final data = value.pedestrianVulnerableRoad;
        if (data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              //    mainAxisAlignment: MainAxisAlignment.start,
              //    crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createHeadingText(data.title),
                buildImage(data.image),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    data.subtitle,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const AutoSizeText(
                //   "",
                //   textAlign: TextAlign.justify,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(data.subtitle1),
                ),
                const SizedBox(
                  height: 10,
                ),
                // const AutoSizeText(
                //     ),
                // const SizedBox(
                //   height: 05,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                      "Watch out for pedestrians already crossing when you’re turning into a side road. They have priority, so allow them to finish crossing."),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildImage(data.image1),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTipWidget(data.tip),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const AutoSizeText(
                    "Pedestrian crossings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // const AutoSizeText(""),
                // const SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(data.subtitle2),
                ),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                  //  color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                   // border: Border.all(color: Colors.green),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTipWidget(
                          "${data.tip2[0]}",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTipWidget(
                          " ${bullet} ${data.tip2[1]}",


                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTipWidget(
                          " ${bullet} ${data.tip2[2]}",

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTipWidget(
                          " ${bullet} ${data.tip2[3]}",

                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigate to the next tip or page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Children(),
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
