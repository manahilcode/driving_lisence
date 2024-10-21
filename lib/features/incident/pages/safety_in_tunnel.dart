import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/incident/pages/stop_at_in_accident.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SafetyInTunnel extends StatefulWidget {
  const SafetyInTunnel({super.key});

  @override
  State<SafetyInTunnel> createState() => _SafetyInTunnelState();
}

class _SafetyInTunnelState extends State<SafetyInTunnel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:   AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Safety In Tunnel',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              createHeadingText("Safety in tunnels"),
              const SizedBox(
                height: 10,
              ),

              buildImage("https://via.placeholder.com/400"),
              createAutoSizeText(
                  "You need to take extra care when driving in a tunnel because"),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText(
                        "when you enter the tunnel, visibility is suddenly reduced"),
                    buildBulletText(
                        "the confined space can make incidents difficult to deal with."),
                  ],
                ),
              ),
    createAutoSizeText("Before driving through a tunnel, remove your sunglasses if you’re wearing them and switch on dipped headlights. It’s particularly important to keep a safe distance from the vehicle in front when driving in a tunnel, even if it’s congested."),
 const SizedBox(
   height: 10,
 ),
              buildImage("https://via.placeholder.com/400"),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText("Look out for signs that warn of accidents or congestion"),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText("If your vehicle is involved in an incident or breaks down in a tunnel"),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText("switch off the engine"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildBulletText("switch on your hazard warning lights"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildBulletText("go and call for help immediately from the nearest emergency telephone point."),

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText("If your vehicle catches fire while you’re driving through a tunnel, drive it out of the tunnel if you can do so without causing further danger. If this isn’t possible then you should"),
              const SizedBox(height: 10,),
              Container(

                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText("stop"),
                    buildBulletText("switch on your hazard warning lights"),
                    buildBulletText("try to put out the fire – but only if it’s a small fire"),
                    buildBulletText("call for help at the nearest emergency point."),
                  ],
                ),
              ),
                const SizedBox(
                  height: 20,
                ),
              buildTipWidget("If your engine catches fire while you’re driving, pull up as quickly and safely as possible. Get yourself and any passengers out and away from the vehicle. Then call the fire brigade. Don’t open the bonnet, as this will make the fire worse."),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const StopAtInAccident()),
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
                          offset: Offset(0, 3),
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

  Widget createAutoSizeText(String text,
      {double fontSize = 14, Color color = Colors.black87}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
          // color: Colors.green.withOpacity(0.1),
          // borderRadius: BorderRadius.circular(10),
          //  border: Border.all(color: Colors.green),
          ),
      child: AutoSizeText(
        text,
        style: GoogleFonts.roboto(
          fontSize: fontSize,
          color: color,
        ),
        // Set the maximum number of lines
        minFontSize: 8, // Set the minimum font size
        overflow: TextOverflow.clip, // Handle overflow with ellipsis
      ),
    );
  }

  AutoSizeText createHeadingText(String heading,
      {double fontSize = 24, Color color = Colors.green}) {
    return AutoSizeText(
      heading,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold, // Make the heading bold
        color: color,
      ),
      maxLines: 1, // Typically, headings are one line
      minFontSize: 16, // Set a minimum font size
      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
    );
  }

  Widget buildTipWidget(String paragraphText) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row containing the thumb icon and "Tip" text
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.thumb_up, size: 24.0, color: Colors.green),
              SizedBox(width: 8.0), // Space between icon and text
              Text(
                'Tip',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 10.0), // Space between the tip and the paragraph
          // Paragraph text
          Text(
            paragraphText,
            style: GoogleFonts.roboto(fontSize: 13.0),
          ),
        ],
      ),
    );
  }

  Widget buildBulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bullet point (a simple dot)
        Container(
          margin: const EdgeInsets.only(top: 6.0), // Align bullet with text
          child: const Icon(
            Icons.fiber_manual_record, // Use a dot icon for the bullet
            size: 10.0,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8.0), // Space between bullet and text
        // Text next to the bullet
        Expanded(
          child: Container(
            child: Text(
              text,
              style: GoogleFonts.roboto(fontSize: 13.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage(String imagePath,
      {double width = 100, double height = 100}) {
    return Image.network(
      imagePath,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover, // Adjust how the image fits in the box
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey, // Placeholder color in case of an error
          child: const Center(
              child: Text('Image not found',
                  style: TextStyle(color: Colors.white))),
        );
      },
    );
  }
}
