import 'package:flutter/material.dart';
import 'student-api.dart';
import 'student.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _isSearching = false;
  String f_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: !_isSearching
            ? Text("LOCOTRACKI")
            : Container(width:3000,child:TextField(
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.name,
          cursorColor: Colors.white,
          onChanged: (value) {
            setState(() {
              f_name = value;
              //query

            });
          },
          decoration: InputDecoration(fillColor: Colors.blue, filled: true),
        ),),
        actions: <Widget>[
          IconButton(
              icon: !_isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  this._isSearching = !_isSearching;
                });
              }),
        ],
      ),
      body: Container(
        // ignore: missing_required_param
        child: FutureBuilder(
          future: fetchStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Students students = snapshot.data[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${students.universityId}',
                            style: TextStyle(
                                fontSize: 20, color: Colors.redAccent),
                          ),
                          Text(
                            '${students.firstName}',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                          Text(
                            '${students.location}',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
