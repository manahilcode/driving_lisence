import 'package:flutter/material.dart';

class OfferDetailScreen extends StatefulWidget {
  const OfferDetailScreen({super.key});

  @override
  State<OfferDetailScreen> createState() => _OfferDetailScreenState();
}

class _OfferDetailScreenState extends State<OfferDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Offer Details"),
      ),
       // body contain column which have image  ,title ,subtitle and button
      body: Column(
        children: [
          buildImage(),
          buildTitle(),
          buildSubtitle(),
          buildButton(),
        ],
      )
    );
  }
  // buildimage
  Widget buildImage(){
    return const Image(image: AssetImage("assets/L.png"));
  }
  // buildtitle
  Widget buildTitle(){
    return const Text("Offer Title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
}
  // buildsubtitle
  Widget buildSubtitle(){
    return const Text("Offer Subtitle",style: TextStyle(fontSize: 16),);
  }
  // buildbutton
  Widget buildButton(){
    return ElevatedButton(onPressed: (){}, child: const Text("Apply"));
  }
}
