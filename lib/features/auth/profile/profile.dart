import 'package:driving_lisence/core/size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';

import '../pages/widget/signup.dart';
import '../viewmodel/controller.dart';
import '../viewmodel/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
  final controller = Provider.of<UserProvider>(context,listen: false);
     controller.fetchUserData(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: Colors.grey.shade100,
          title: Text(
            'Profile',
            style: GoogleFonts.roboto(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<UserProvider>(
          builder: (context,provider,child) {
            final user = provider.user;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Gap(20),
                    Container(
                      height: context.percentHeight(08),
                      width: context.percentWidth(100),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Center(
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' ABOUT ME',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ),

                    Gap(10),
                    // make text lable and then textfield
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          textAlign: TextAlign.start,
                          ' First Name',
                          style: GoogleFonts.roboto(


                          ),
                        ),
                      ),
                    ),

                    /// textfield name
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(

                        decoration: InputDecoration(
                          hintText: '${user!.name ?? ''}',
                            hintStyle: GoogleFonts.roboto(
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' Last Name',
                          style: GoogleFonts.roboto(


                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: user!.name ?? "Last Name",
                            hintStyle: GoogleFonts.roboto(
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    // email
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                              ),
                            ),
                          ),
                           // how show tickmark here
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: user.email ?? 'abc@gmail.com',
                            hintStyle: GoogleFonts.roboto(
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Gap(10),
                    Container(
                      height: context.percentHeight(08),
                      width: context.percentWidth(100),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              ' ABOUT YOUR DRIVING TEST',
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                    Gap(10),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question Bank',
                        style: GoogleFonts.roboto(
                        color: Colors.grey,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Car',
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.black
                          )
                        ),
                      ),
                    ),

                    Gap(30),
                    /// Logout button
                    Align(
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text('Log out', style: TextStyle(color: Colors.red)),
                        onTap: () {
                          PanaraConfirmDialog.show(
                            context,
                            title: "Logout",
                            message: "Are You Sure Logout",
                            confirmButtonText: "Confirm",
                            cancelButtonText: "Cancel",
                            onTapCancel: () {
                              Navigator.pop(context);
                            },
                            onTapConfirm: () async{
                              final auth = Provider.of<AuthController>(context, listen: false);
                              await auth.signOut();
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const RegistorScreen()), (route) => false);

                            },
                            panaraDialogType: PanaraDialogType.warning,
                            barrierDismissible: false, // optional parameter (default is true)
                          );
                        }),
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


