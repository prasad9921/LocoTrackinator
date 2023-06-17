import 'package:flutter/material.dart';
import 'st.dart';

class Faculty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LocoTrackinator"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Text(
          'Search Here For Student/Faculty/Dean/HOD Location',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
