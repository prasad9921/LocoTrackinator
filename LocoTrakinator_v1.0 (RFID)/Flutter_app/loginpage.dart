import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'constants.dart';
import 'fifthscreen.dart';
import 'fourthscreen.dart';
import 'secondscreen.dart';
import 'thirdscreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool _showPassword = false;
  bool checkedBoxValue = false;
  //String greetings = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          // ignore: missing_required_param
          child: Image.asset('assets/loco.jpg'),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'E-mail'),
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'E-mail is Required.';
          } else if (!value.contains("@kluniversity.in")) {
            return 'Enter your KL University Mail ID.';
          }
        },
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: !_showPassword,

        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: this._showPassword ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() => this._showPassword = !this._showPassword);
            },
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
        ),
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required.';
          } else if (value.length <= 6) {
            return 'Password Should be >=6 Characters.';
          } else if (value.length > 15) {
            return 'Password Should be in the range of 8 to 15 Characters.';
          }
        },
      ),
    );
  }

  Widget _buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: checkedBoxValue,
          onChanged: (bool value) {
            print(value);
            setState(() {
              checkedBoxValue = value;
            });
          },
        ),
        Text("Remember Me"),
      ],
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("Forgot Password"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              if (!_formkey.currentState.validate()) {
                return;
              } else {
                if ((email.length == 25) &&
                    (email.contains('1700') ||
                        email.contains('1800') ||
                        email.contains('1900') ||
                        email.contains('2000'))) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen(email: email)));
                } else if (email.contains('ecehod@kluniversity.in') ||
                    email.contains('cse.hod@kluniversity.in') ||
                    email.contains('hod.chemistry@kluniversity.in') ||
                    email.contains('hod_mech@kluniversity.in') ||
                    email.contains('hod.ce@kluniversity.in')) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThirdScreen(email: email)));
                } else if (email.contains('dean.academics@kluniversity.in') ||
                    email.contains('deanrnd@kluniversity.in') ||
                    email.contains('deanpnd@kluniversity.in')) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FourthScreen(email: email)));
                } else if (!(email.contains('1700') ||
                    email.contains('1800') ||
                    email.contains('1900') ||
                    email.contains('2000'))) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FifthScreen(email: email)));
                }
              }
              // ignore: unused_local_variable
            },
            child: Text(
              "LOGIN",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildEmailRow(),
                  _buildPasswordRow(),
                  _buildRememberMe(),
                  _buildForgetPasswordButton(),
                  _buildLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        //backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.82,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildLogo(),
                        _buildName(),
                        _buildContainer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Text(
            'LocoTrackinator',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
  //get _buildImage {}
}
