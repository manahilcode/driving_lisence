import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

Widget createAutoSizeText(String text,
    {double fontSize = 16, Color color = Colors.black87}) {
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
        const SizedBox(height: 10.0), // Space between the tip and the paragraph
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
      Gap(10),
      Container(
        margin: const EdgeInsets.only(top: 6.0), // Align bullet with text
        child: const Icon(
          Icons.fiber_manual_record, // Use a dot icon for the bullet
          size: 10.0,
          color: Colors.green,
        ),
      ),
      SizedBox(width: 8.0), // Space between bullet and text
      // Text next to the bullet
      Expanded(
        child: Container(
          padding: EdgeInsets.all(3),
          child: Text(
            text,
            style:
                GoogleFonts.roboto(fontSize: 15.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Gap(10),
    ],
  );
}

Widget buildImage(String imagePath, {double width = 100, double height = 100}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.network(
      imagePath,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover, // Adjust how the image fits in the box
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            width: width,
            height: height,
            color: Colors.grey.shade200, // Placeholder background color
            child: const Center(
              child:
                  CircularProgressIndicator(), // Loading indicator while fetching the image
            ),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey, // Placeholder color in case of an error
          child: const Center(
            child: Text(
              'Image not found',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    ),
  );
}
