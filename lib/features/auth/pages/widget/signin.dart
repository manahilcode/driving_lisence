import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/features/auth/pages/widget/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/controller.dart';
import '../registration_screen.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscureText = true;
  bool _isLoading = false;

  // Function to handle signin logic
     void _handleSignin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });
      final controller = Provider.of<AuthController>(context, listen: false);
      controller.SignInWithEmailAndPassword(context, _email, _password).then((_) {
        setState(() {
          _isLoading = false; // Stop loading
        });
      }).catchError((error) {
        setState(() {
          _isLoading = false; // Stop loading on error
        });
        // Handle error here (e.g., show a SnackBar with error message)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Gap(10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Lets Get Started",
                    style: GoogleFonts.roboto(
                      fontSize: 32, // Larger font size for the title
                      fontWeight: FontWeight.bold, // Bold for emphasis
                      color: Colors.green,
                    ),
                  ),
                ), // Green color for the title),),),
                Gap(10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.roboto(
                      fontSize: 20, // Larger font size for the title
                      fontWeight: FontWeight.w700, // Bold for emphasis
                      color: Colors.black54,
                    ),
                  ),
                ),
                const Gap(10),
                Align(
                  alignment: Alignment.topLeft,
                  child: AutoSizeText(
                    "Sign in to access your saved progress and keep track of your learning.",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.grey[600], // Light gray for subheading
                    ),
                  ),
                ),
                const Gap(50),
        
                // Email Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.roboto(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => setState(() => _email = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                Gap(20),
                // Password Input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.roboto(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                    ),
                  ),
                  obscureText: _obscureText,
                  onChanged: (value) => setState(() => _password = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                // Show/Hide Password Toggle
                Row(
                  children: [
                    Checkbox(
                      value: !_obscureText,
                      onChanged: (value) {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    Text('Show Password',style: GoogleFonts.roboto(color: Colors.grey,),),
                  ],
                ),
                SizedBox(height: 20),
                // Signin Button
               GestureDetector(
                  onTap: () async {

                     _handleSignin();
                    ;
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isLoading ? Colors.grey : Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        _isLoading ? 'Loading...' : 'Sign In',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Switch to Signup screen
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: GoogleFonts.roboto(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.roboto(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => RegistorScreen(),
                                ));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
