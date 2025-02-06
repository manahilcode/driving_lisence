import 'package:auto_size_text/auto_size_text.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/auth/pages/widget/signin.dart';
import 'package:driving_lisence/features/auth/viewmodel/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../category.dart' as cat;

class RegistorScreen extends StatefulWidget {
  const RegistorScreen({super.key});

  @override
  _RegistorScreenState createState() => _RegistorScreenState();
}

class _RegistorScreenState extends State<RegistorScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;
  bool _isLoading = false; // Loading state

  // Function to handle signup logic
  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });
      final auth = Provider.of<AuthController>(context, listen: false);
      auth.SignUpWithEmailAndPassword(context, _name, _email, _password);
      setState(() {
        _isLoading = false; // Stop loading
      });
      print("Name: $_name");
      print("Email: $_email");
      print("Password: $_password");

      // You can add actual sign up logic (e.g., Firebase Authentication) here.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('Signup', style: GoogleFonts.roboto(color: Colors.white)),
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
                // Attractive Heading
                Center(
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
                          "Sign Up",
                          style: GoogleFonts.roboto(
                            fontSize: 20, // Larger font size for the title
                            fontWeight: FontWeight.w700, // Bold for emphasis
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Gap(10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          "Create an account to get started"
                          " with our amazing services.",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.grey[600], // Light gray for subheading
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(50),
        
                // Name Input
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: GoogleFonts.roboto(color: Colors.grey),
                      hintText: 'Enter your full name',
                      hintStyle: GoogleFonts.roboto(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      ),
                    ),
                    onChanged: (value) => setState(() => _name = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
        
                // Email Input
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.roboto(color: Colors.grey),
                      hintText: 'Enter your email',
                      hintStyle: GoogleFonts.roboto(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2),
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
                ),
        
                // Password Input
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      ),
                    ),
                    obscureText: _obscureTextPassword,
                    onChanged: (value) => setState(() => _password = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
        
                // Confirm Password Input
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: GoogleFonts.roboto(color: Colors.grey),
                      hintText: 'Re-enter your password',
                      hintStyle: GoogleFonts.roboto(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent, width: 2),
                      ),
                    ),
                    obscureText: _obscureTextConfirmPassword,
                    onChanged: (value) =>
                        setState(() => _confirmPassword = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
        
                // Show/Hide Password Toggle
                Row(
                  children: [
                    Checkbox(
                      value: !_obscureTextPassword,
                      onChanged: (value) {
                        setState(() {
                          _obscureTextPassword = !_obscureTextPassword;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                    ),
                    Text(
                      'Show Password',
                      style: GoogleFonts.roboto(),
                    )
                  ],
                ),
        
                // Show/Hide Confirm Password Toggle
                Row(
                  children: [
                    Checkbox(
                      value: !_obscureTextConfirmPassword,
                      onChanged: (value) {
                        setState(() {
                          _obscureTextConfirmPassword =
                              !_obscureTextConfirmPassword;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                    ),
                    Text(
                      'Show Confirm Password',
                      style: GoogleFonts.roboto(),
                    )
                  ],
                ),
        
                const SizedBox(height: 20),
        
                // Signup Button
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GestureDetector(
                  onTap: (){
        
                    _handleSignup();
        
                  },
                      child: Container(
                         width: 200,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("Sign Up",style: GoogleFonts.roboto(color: Colors.white),))
                      ),
                    ),
                const SizedBox(height: 20),
        
                // Switch to Sign In screen
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: GoogleFonts.roboto(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: GoogleFonts.roboto(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SigninScreen(),
                              ),
                            );
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
