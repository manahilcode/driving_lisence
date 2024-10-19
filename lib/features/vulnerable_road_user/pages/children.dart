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
        title: Text(
          "Children",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Children are particularly vulnerable as road users because they can be unpredictable. They’re less likely than other pedestrians to look before stepping into the road.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              AutoSizeText(
                "Drive carefully near schools",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 12),
              buildInfoRow(
                imagePath: "assets/L.png",
                text:
                "Don’t wait or park on yellow zigzag lines outside a school. A clear view of the crossing area outside the school is needed by drivers and riders on the road.",
              ),
              const SizedBox(height: 12),
              buildInfoRow(
                text:
                "There may be flashing amber lights under a school warning sign, to show that children are likely to be crossing the road on their way to or from school. Slow down until you’re clear of the area.",
                imagePath: "assets/L.png",
              ),
              const SizedBox(height: 12),
              buildInfoRow(
                imagePath: "assets/L.png",
                text:
                "Be prepared for a school crossing patrol to stop the traffic by stepping out into the road with a stop sign. You MUST obey the stop signal given by a school crossing patrol.",
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OlderDisabledPedistrains(),
                      ),
                          (Route<dynamic> route) => false, // Removes all previous routes
                    );
                  },
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
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

  Widget buildInfoRow({required String text, required String imagePath}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AutoSizeText(
              text,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        Image.asset(
          imagePath,
          height: 130,
          width: 130,
        ),
      ],
    );
  }
}
