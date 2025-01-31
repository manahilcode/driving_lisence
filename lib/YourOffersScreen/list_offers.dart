import 'package:flutter/material.dart';

class ListOffersScreen extends StatefulWidget {
  const ListOffersScreen({super.key});

  @override
  State<ListOffersScreen> createState() => _ListOffersScreenState();
}

class _ListOffersScreenState extends State<ListOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Offers'),

      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 80,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white30,
            ),
            child: Row(
              children: [
                // image container
                Container(
                  width: 100,
                  height: 80,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white30,
                  ),
                  child: const Center(
                    child: Text('image'),
                  ),
                ),
                // divider
                const VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                ),
                // text container
                Container(
                  width: 200,
                  height: 80,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white30,
                  ),
                  child: const Center(
                    child: Text('text'),
                  ),
                ),
                // title and subtitle in column
                Column(
                  children: const [
                    Text('title'),
                    Text('subtitle'),
                  ],
                ),
                // small container with grey color with arrow forword icon
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white30,
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_forward),
                  ),
                ),

              ],
            ),
          );

      },)
    );
  }
}
