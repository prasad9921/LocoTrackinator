// To parse this JSON data, do
//
//     final students = studentsFromMap(jsonString);

import 'dart:convert';

List<Students> studentsFromMap(String str) =>
    List<Students>.from(json.decode(str).map((x) => Students.fromMap(x)));

String studentsToMap(List<Students> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Students {
  Students({
    this.universityId,
    this.firstName,
    this.lastName,
    this.eMail,
    this.location,
  });

  String universityId;
  String firstName;
  String lastName;
  String eMail;
  String location;

  factory Students.fromMap(Map<String, dynamic> json) => Students(
        universityId: json["UNIVERSITY ID"],
        firstName: json["FIRST NAME"],
        lastName: json["LAST NAME"],
        eMail: json["E-MAIL"],
        location: json["LOCATION"],
      );

  Map<String, dynamic> toMap() => {
        "UNIVERSITY ID": universityId,
        "FIRST NAME": firstName,
        "LAST NAME": lastName,
        "E-MAIL": eMail,
        "LOCATION": location,
      };
}
