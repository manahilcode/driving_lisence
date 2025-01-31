import 'package:flutter/material.dart';

class Morescreen extends StatefulWidget {
  const Morescreen({super.key});

  @override
  State<Morescreen> createState() => _MorescreenState();
}

class _MorescreenState extends State<Morescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Text("More"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  enabled: true,
                  contentPadding: EdgeInsets.all(1),
                  hoverColor: Colors.grey,
                  splashColor: Colors.grey,
                  title: Text("Help Center"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(1),
                  title: Text("Downloads"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(1),
                  title: Text("Share"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(1),
                  title: Text("Rate"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(1),
                  title: Text("Social media question bank"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(1),
                  title: Text("Legal"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(1),
                  title: Text("About"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Divider(),
            ],
          ),
        ));
  }
}
