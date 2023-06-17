import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'about.dart';
import 'dean.dart';
import 'faculty.dart';
import 'hod.dart';
import 'loginpage.dart';
import 'students.dart';

// ignore: must_be_immutable
class ThirdScreen extends StatelessWidget {
  String email;
  ThirdScreen({this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOCOTRACKI"),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: Text(email),
            ),
            new ListTile(
              leading: Icon(MdiIcons.accountBox),
              title: new Text('Student'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Student()));
              },
            ),
            new ListTile(
              leading: Icon(MdiIcons.accountVoice),
              title: new Text('Faculty'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Faculty()));
              },
            ),
            new ListTile(
              leading: Icon(MdiIcons.accountTieOutline),
              title: new Text('HOD'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new HOD()));
              },
            ),
            new ListTile(
              leading: Icon(MdiIcons.accountTie),
              title: new Text('Dean'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Dean()));
              },
            ),
            new ListTile(
              leading: Icon(MdiIcons.accountDetails),
              title: new Text('About us'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new AboutPage()));
              },
            ),
            new ListTile(
              leading: Icon(MdiIcons.arrowLeft),
              title: new Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'You are now logged in as HOD',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
