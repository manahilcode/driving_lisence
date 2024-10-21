import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/incident/pages/warning_other_of_breakdown_or_incident.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Breakdowns extends StatefulWidget {
  const Breakdowns({super.key});

  @override
  _BreakdownsState createState() => _BreakdownsState();
}

class _BreakdownsState extends State<Breakdowns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Breakdowns',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createHeadingText("Breakdowns"),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText(
                  "If you’re involved in an incident on the road, such as your car breaking down or arriving first at the scene of a crash, knowing what to do can prevent a more serious situation from developing."),
              const SizedBox(
                height: 10,
              ),
              buildTipWidget(
                  "It’s useful to carry a first aid kit, a warning triangle and a fire extinguisher in your car for use in an emergency. This equipment could help to prevent or lessen an injury. You may be able to tackle a small fire if you have a fire extinguisher, but don’t take any risks."),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText(
                  "Knowing what to do if your car breaks down will help keep you and your passengers safe, and avoid creating problems for other road users, such as traffic jams."),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText(
                  "If a warning light shows on the instrument panel of your vehicle, you may have a problem that affects the safety of the vehicle. If necessary, stop as soon as you can do so safely and check the problem."),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText(
                  "If your tyre bursts or you get a puncture while you’re driving"),
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
                    buildBulletText("hold the steering wheel firmly"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildBulletText(
                        "pull up slowly or roll to a stop at the side of the road."),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
               SizedBox(
                 height: 10,
               ),
              buildImage("https://via.placeholder.com/400"),
              const SizedBox(
                height: 10,
              ),
              buildTipWidget(
                  "If you smell petrol while you’re driving, stop and investigate as soon as you can do so safely. Don’t ignore it."),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText(
                  "If you break down on the motorway, try and reach the next exit or service area. If you cannot do this, move into the left-hand lane and then steer your vehicle into an emergency area or onto the hard shoulder, as safely as possible."),
              const SizedBox(
                height: 10,
              ),
              buildImage("https://via.placeholder.com/400"),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText(
                  "On the hard shoulder, try and stop just beyond an emergency phone and as far to the left as you can, away from the traffic. Leave enough space so that you can get out of the vehicle using the nearside door."),
              const SizedBox(
                height: 10,
              ),
              createAutoSizeText(
                  "If you have any kind of mobility difficulty, you should stay in your vehicle and"),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    buildBulletText("keep your seat belt fastened"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildBulletText("switch on your hazard warning lights"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildBulletText(
                        "dial 999 and ask for the police. Alternatively, if your vehicle has an SOS button, press it and ask for the police."),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

              createAutoSizeText("If you break down on a level crossing"),
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
                        "get everyone out of the vehicle and clear of the crossing"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildBulletText(
                        "call the signal operator from the phone provided"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildBulletText(
                        "only move your vehicle if the operator tells you to do so."),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              createAutoSizeText(
                  "If you’re waiting at a level crossing and the red light signal continues to flash after a train has gone by, you MUST wait, as another train may be coming."),
              const SizedBox(
                height: 10,
              ),
              buildImage("https://via.placeholder.com/400"),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const WarningOtherOfBreakdownOrIncident()),
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
      decoration: BoxDecoration(
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
        SizedBox(width: 8.0), // Space between bullet and text
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
