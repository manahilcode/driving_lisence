import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';
import 'Cyclists.dart';

class OlderDisabledPedistrains extends StatefulWidget {
  const OlderDisabledPedistrains({super.key});

  @override
  State<OlderDisabledPedistrains> createState() =>
      _OlderDisabledPedistrainsState();
}

class _OlderDisabledPedistrainsState extends State<OlderDisabledPedistrains> {
  VulnerableController? _vulnerableController;

  @override
  void didChangeDependencies() {
    _vulnerableController = Provider.of<VulnerableController>(context,listen: false);
    _vulnerableController?.fetchOlderDisabledPedestrians();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Older and disabled pedestrians",style: GoogleFonts.roboto(
            color: Colors.white
        )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<VulnerableController>(
        builder: (context,value,child) {
          final data = value.olderDisabledPedestrians;
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
                  buildImage(data.image1),
                  const SizedBox(
                    height: 30,
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: AutoSizeText(
                      data.subtitle1
                                       ),
                   ),
                  const SizedBox(
                    height: 20,
                  ),
                 buildImage(data.image2),
                  const SizedBox(
                    height: 30,
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: AutoSizeText(
                        data.subtitle2),
                   ),

                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next tip or page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cyclists()), // Change this
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
      ),
    );
  }
}
