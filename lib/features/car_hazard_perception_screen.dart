import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../menu_screen.dart';

class CarHazardPerceptionScreen extends StatefulWidget {
  const CarHazardPerceptionScreen({super.key});

  @override
  State<CarHazardPerceptionScreen> createState() =>
      _CarHazardPerceptionScreenState();
}

class _CarHazardPerceptionScreenState extends State<CarHazardPerceptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("car hazard perception",style: GoogleFonts.roboto(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return MenuScreen(); // Replace with your actual screen widget
            }),
          );
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text("test")
          ),
          ListTile(

              title: Text("test")
          ),
          ListTile(

              title: Text("test")
          ),
          ListTile(

              title: Text("test")
          ),
          ListTile(

              title: Text("test")
          ),

        ],
      ),
    );
  }
}
