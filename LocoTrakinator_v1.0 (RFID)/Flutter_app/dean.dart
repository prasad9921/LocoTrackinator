import 'package:flutter/material.dart';

class Dean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOCOTRACKI"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Text(
          'Enter Dean Details to Find His/Her Location...',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
