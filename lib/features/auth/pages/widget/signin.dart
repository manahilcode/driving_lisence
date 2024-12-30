import 'package:flutter/material.dart';
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

  // Function to handle signin logic
  void _handleSignin() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with signin logic
      print("Email: $_email");
      print("Password: $_password");

      // call here
      final controller = Provider.of<AuthController>(context, listen: false);
      controller.SignInWithEmailAndPassword(context, _email, _password);



      // Here, you can call your authentication function, e.g., Firebase Authentication
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Email Input
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => setState(() => _email = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              // Password Input
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
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
                  Text('Show Password')
                ],
              ),
              SizedBox(height: 20),
              // Signin Button
              ElevatedButton(
                onPressed: _handleSignin,
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              // Switch to Signup screen
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SignupScreen(), // Replace with Signup screen
                  ));
                },
                child: Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
