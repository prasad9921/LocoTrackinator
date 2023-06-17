import 'package:flutter/material.dart';




class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About us'),
      ),
      body: Center(
        child:Text('Our infooooooo',
          style: TextStyle(
            color: Colors.black,
          ),
        ),

      ),
    );
  }
}