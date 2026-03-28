import 'package:auth_buttons/auth_buttons.dart';
import 'package:driving_lisence/features/auth/pages/widget/signup.dart';
import 'package:driving_lisence/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';

import '../viewmodel/controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isCheckedEmergency = false;

  bool isCheckedPartners = false;

  bool isCheckedTerms = false;

  bool get isAllChecked =>
      isCheckedEmergency && isCheckedPartners && isCheckedTerms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Your Theory Test',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Text(
                'Progress Tracker',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Last step.',
                  style: GoogleFonts.actor(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tick all that apply',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Checkbox with vertical alignment fix
                    Align(
                      alignment: Alignment.topCenter,
                      child: Checkbox(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: isCheckedEmergency,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isCheckedEmergency = newValue ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Add spacing between checkbox and text
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.black, // Set your text color
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'I would like to receive The New Driver Emergency Checklist '
                                  'and advice from Driving Test Success.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Checkbox with vertical alignment fix
                    Align(
                      alignment: Alignment.topCenter,
                      child: Checkbox(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: isCheckedPartners,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isCheckedPartners = newValue ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Add spacing between checkbox and text
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.black, // Set your text color
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'I would like to receive information from specially selected partners via email.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // CheckboxListTile(
                //   value: isCheckedPartners,
                //   onChanged: (bool? newValue) {
                //     setState(() {
                //       isCheckedPartners = newValue ?? false;
                //     });
                //   },
                //   title: const Text(
                //     'I would like to receive information from specially selected partners via email.',
                //     style: TextStyle(fontSize: 14),
                //   ),
                //   controlAffinity: ListTileControlAffinity.leading,
                // ),

                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Checkbox with vertical alignment fix
                    Align(
                      alignment: Alignment.topCenter,
                      child: Checkbox(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: isCheckedTerms,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isCheckedTerms = newValue ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Add spacing between checkbox and text
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black, // Set your text color
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'I have read and agree to the Terms and Conditions and Privacy Policy.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Row(
                //   children: [
                //     Checkbox(
                //       value: isCheckedTerms,
                //       onChanged: (bool? newValue) {
                //         setState(() {
                //           isCheckedTerms = newValue ?? false;
                //         });
                //       },
                //     ),
                //     RichText(
                //       text: const TextSpan(
                //         style: TextStyle(
                //           fontSize: 14,
                //           color: Colors.black,
                //         ),
                //         children: [
                //           TextSpan(
                //             text: 'I have read and agree to the \n',
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.black,
                //             ),
                //           ),
                //           TextSpan(
                //             text: 'Terms and Conditions',
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.blue,
                //               decoration: TextDecoration.underline,
                //             ),
                //           ),
                //           TextSpan(
                //             text: ' and ',
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.black,
                //             ),
                //           ),
                //           TextSpan(
                //             text: 'Privacy Policy',
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.blue,
                //               decoration: TextDecoration.underline,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 40),
                // GestureDetector(
                //   onTap: isAllChecked
                //       ? () {
                //           final auth = Provider.of<AuthController>(context,
                //               listen: false);
                //           auth.setUsrData({"agreement": true});
                //           Navigator.pushAndRemoveUntil(context,
                //               MaterialPageRoute(
                //                   builder: (BuildContext context) {
                //             return const SignUpScreen();
                //           }), (route) => false);
                //         }
                //       : () {
                //           ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                //             const SnackBar(
                //               content: Text("Select the boxes first please"),
                //             ),
                //           );
                //         },
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(
                //           8), // Rounded corners for the container
                //     ),
                //     child: const Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(Icons.email, color: Colors.white),
                //         SizedBox(width: 10),
                //         Text(
                //           'Continue with Email',
                //           style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Container(
                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: EmailAuthButton(
                      darkMode: true,
                      onPressed: isAllChecked
                          ? () {
                              final auth = Provider.of<AuthController>(context,
                                  listen: false);
                              auth.setUsrData({"agreement": true});
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return const RegistorScreen();
                              }), (route) => false);
                            }
                          : () {
                              PanaraInfoDialog.show(
                                context,
                                title: "Hello",
                                message: "Check The All Boxes First Please",
                                buttonText: "Okay",
                                onTapDismiss: () {
                                  Navigator.pop(context);
                                },
                                panaraDialogType: PanaraDialogType.normal,
                                barrierDismissible:
                                    false, // optional parameter (default is true)
                              );
                            },
                      style: AuthButtonStyle(
                        buttonColor: Colors.white,
                        buttonType: AuthButtonType.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: GoogleAuthButton(
                    onPressed: isAllChecked
                        ? () {
                            final auth = Provider.of<AuthController>(context,
                                listen: false);
                            auth.setUsrData({"agreement": true});
                            auth.SignInWithGoogle(context);
                            // Navigator.pushAndRemoveUntil(context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) {
                            //           return const RegistorScreen();
                            //         }), (route) => false);
                          }
                        : () {
                            PanaraInfoDialog.show(
                              context,
                              title: "Hello",
                              message: "Check The All Boxes First Please",
                              buttonText: "Okay",
                              onTapDismiss: () {
                                Navigator.pop(context);
                              },
                              panaraDialogType: PanaraDialogType.normal,
                              barrierDismissible:
                                  false, // optional parameter (default is true)
                            );
                          },
                    style: AuthButtonStyle(
                      buttonColor: Colors.white,
                      buttonType: AuthButtonType.secondary,
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: isAllChecked
                //       ? () {
                //           final auth = Provider.of<AuthController>(context,
                //               listen: false);
                //           auth.setUsrData({"agreement": true});
                //           auth.SignInWithGoogle(context);
                //           // Navigator.pushAndRemoveUntil(context,
                //           //     MaterialPageRoute(
                //           //         builder: (BuildContext context) {
                //           //           return const RegistorScreen();
                //           //         }), (route) => false);
                //         }
                //       : () {
                //           ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                //             const SnackBar(
                //               content: Text("check the boxes first please"),
                //             ),
                //           );
                //         },
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(
                //           8), // Rounded corners for the container
                //       border: Border.all(
                //           color: Colors.black,
                //           width: 2), // Black border for Google button
                //     ),
                //     child: const Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(CupertinoIcons.google, color: Colors.black),
                //         SizedBox(width: 10),
                //         Text(
                //           'Continue with Google',
                //           style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10),

                Center(
                  child: AppleAuthButton(
                    onPressed: () {},
                    style: AuthButtonStyle(
                      buttonColor: Colors.white,
                      buttonType: AuthButtonType.secondary,
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: () {
                //     // Handle tap event for Continue with Apple
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(
                //           8), // Rounded corners for the container
                //       border: Border.all(
                //           color: Colors.black,
                //           width: 2), // Black border for Apple button
                //     ),
                //     child: const Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(Icons.apple, color: Colors.black),
                //         SizedBox(width: 10),
                //         Text(
                //           'Continue with Apple',
                //           style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 60),
                _buildBottomNavigation(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back, size: 30),
          Row(
            children: List.generate(
                5,
                (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 1
                            ? Colors.green
                            : index == 2
                                ? Colors.red
                                : Colors.grey,
                      ),
                    )),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward, size: 30),
            onPressed: isAllChecked
                ? () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MenuScreen()),
                    // );
                  }
                : () {
                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                      const SnackBar(
                        content: Text("check the all boxes first please"),
                      ),
                    );
                  },
          ),
        ],
      ),
    );
  }
}
