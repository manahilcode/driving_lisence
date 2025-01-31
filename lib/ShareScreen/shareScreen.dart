import 'package:flutter/material.dart';

class Sharescreen extends StatefulWidget {
  const Sharescreen({super.key});

  @override
  State<Sharescreen> createState() => _SharescreenState();
}

class _SharescreenState extends State<Sharescreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Share",style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Text("Share"),
      ),
    );
  }
}
