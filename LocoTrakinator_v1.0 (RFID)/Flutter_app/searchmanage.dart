import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SEARCHMANAGE extends StatefulWidget {
  @override
  _SEARCHMANAGEState createState() => _SEARCHMANAGEState();
}

class _SEARCHMANAGEState extends State<SEARCHMANAGE> {
  List<MANAGE> _notes = List<MANAGE>();
  List<MANAGE> _notesForDisplay = List<MANAGE>();

  Future<List<MANAGE>> fetchNotes() async {
    // var url = 'http://192.168.0.5/details/management.php';

    var url = 'http://10.46.74.143/details/management.php';
    var response = await http.get(url);

    var notes = List<MANAGE>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(MANAGE.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LocoTrackinator'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          },
          itemCount: _notesForDisplay.length + 1,
        ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.title.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: InkWell(
        //  splashColor: "Insert color when user tap on card",
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => DetailPage(_notesForDisplay[index])));
        },

        //child : new Inkwell(),
        //child: Padding(
        // padding: const EdgeInsets.only(
        // top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        // child: new InkWell(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(_notesForDisplay[index].image),
            ),
            Text(
              _notesForDisplay[index].title,
              style: TextStyle(
                  height: 1.5, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _notesForDisplay[index].text,
              style: TextStyle(height: 1.5, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  // DetailPage(MANAGE notesForDisplay);
  final MANAGE user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LocoTrackinator"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(user.image),
            Text(
              user.title,
              style:
                  TextStyle(color: Colors.black, fontSize: 16.0, height: 2.0),
            ),
            Text(
              user.uid,
              style:
                  TextStyle(color: Colors.black, fontSize: 14.0, height: 2.0),
            ),
            Text(
              user.eMail,
              style:
                  TextStyle(color: Colors.black, fontSize: 14.0, height: 2.0),
            ),
            Text(
              user.designation,
              style:
                  TextStyle(color: Colors.black, fontSize: 14.0, height: 2.0),
            ),
            Text(
              user.text,
              style:
                  TextStyle(color: Colors.black, fontSize: 14.0, height: 2.0),
            ),
            Text(
              user.time,
              style:
                  TextStyle(color: Colors.black, fontSize: 14.0, height: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}

class MANAGE {
  String title;
  String text;
  String image;
  String eMail;
  String time;
  String designation;
  String uid;

  MANAGE(this.title, this.text, this.image, this.eMail, this.time,
      this.designation, this.uid);

  MANAGE.fromJson(Map<String, dynamic> json) {
    title = json['firstName'];
    text = json['location'];
    image = json['image'];

    eMail = json['eMail'];
    time = json['time'];
    designation = json['designation'];
    uid = json['uid'];
  }
}
