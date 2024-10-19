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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vulnerable Road Users",
          style: GoogleFonts.lora( // Using Lora font for the title
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green[700], // Darker shade for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Content Section
              _buildInfoCard(
                text: 'As a car driver, you’ll share the road with many other road users. '
                    'Some of these are more vulnerable than you, because of their',
              ),
              const SizedBox(height: 10),
              _buildBulletPoints([
                " inexperience or lack of judgment",
                " size",
                " speed",
                " unpredictable behavior",
              ]),
              const SizedBox(height: 10),

              // Second Content Section
              _buildInfoCard(
                text: 'In a car you’re also surrounded by bodywork that’s designed to protect '
                    'you in a crash. Among the most vulnerable road users are',
              ),
              const SizedBox(height: 10),
              _buildBulletPoints([
                " pedestrians – especially children and older people",
                " cyclists",
                " motorcyclists",
                " horse riders",
              ]),
              const SizedBox(height: 10),

              // Third Content Section
              _buildTipCard(
                text: 'Remember to treat all road users with courtesy and consideration. '
                    'It’s particularly important to be patient when there are children, older, or disabled people using the road.',
              ),
              const SizedBox(height: 10),

              _buildTipCard(
                text: 'The most vulnerable drivers and riders are those who are still learning, '
                    'inexperienced, or older. Keep calm and make allowances for them.',
              ),
              const SizedBox(height: 20),

              // Next Button
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the next tip or page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VunerableRoadUserTest(),
                      ),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.raleway( // Using Raleway for buttons
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
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

  // Method to create information cards with consistent styling
  Widget _buildInfoCard({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AutoSizeText(
        text,
        style: GoogleFonts.openSans( // Using OpenSans for info text
          fontSize: 16,
          color: Colors.black87,
        ),
        minFontSize: 10,
        stepGranularity: 10,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // Method to create bullet point lists
  Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Larger, colorful bullet symbol
            Text(
              "\u2022", // Unicode for bullet symbol
              style: TextStyle(
                fontSize: 30, // Make the bullet larger
                color: Colors.green[700], // Customize the color
                height: 1.2, // Adjust height to align bullet with text
              ),
            ),
            const SizedBox(width: 8), // Add space between bullet and text

            // Bullet point text
            Expanded(
              child: AutoSizeText(
                point,
                style: GoogleFonts.roboto(
                  fontSize: 16, // Increase text size
                  color: Colors.black87, // Text color
                  fontWeight: FontWeight.w500, // Slightly bold for emphasis
                ),
                textAlign: TextAlign.left,
                minFontSize: 12, // Minimum text size
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  // Method to create highlighted tip cards
  Widget _buildTipCard({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AutoSizeText(
        text,
        style: GoogleFonts.openSans( // Using Montserrat for tip text
          fontSize: 16,
          color: Colors.black87,
        ),
        minFontSize: 10,
        stepGranularity: 10,
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
