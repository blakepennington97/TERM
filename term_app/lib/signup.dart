import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController userFirst = new TextEditingController();
  TextEditingController userLast = new TextEditingController();
  TextEditingController userEmail = new TextEditingController();
  TextEditingController userPassword = new TextEditingController();

  bool valFirst = false;
  bool valLast = false;
  bool valEmail = false;
  bool valPassword = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 170.0),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: userFirst,
                        decoration: InputDecoration(
                            labelText: 'FIRST NAME',
                            errorText: valFirst ? 'Can\'t be empty' : null,
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade900))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: userLast,
                        decoration: InputDecoration(
                            labelText: 'LAST NAME',
                            errorText: valLast ? 'Can\'t be empty' : null,
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade900))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: userEmail,
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            errorText: valEmail ? 'Can\'t be empty' : null,
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade900))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: userPassword,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            errorText: valPassword ? 'Can\'t be empty' : null,
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade900))),
                        obscureText: true,
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.grey[800],
                            color: Colors.red.shade900,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  userFirst.text.isEmpty
                                      ? valFirst = true
                                      : valFirst = false;
                                  userLast.text.isEmpty
                                      ? valLast = true
                                      : valLast = false;
                                  userEmail.text.isEmpty
                                      ? valEmail = true
                                      : valEmail = false;
                                  userPassword.text.isEmpty
                                      ? valPassword = true
                                      : valPassword = false;
                                });

                                //String email = userEmail.text;
                                //String password = userEmail.text;

                                //FirebaseAuth _auth = FirebaseAuth.instance;

                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: userEmail.text.toString(),
                                    password: userPassword.text.toString(),
                                  );

                                  await FirebaseAuth.instance.currentUser
                                      .updateProfile(
                                          displayName:
                                              (userFirst.text.toString() +
                                                  ' ' +
                                                  userLast.text.toString()));
                                  //if (newUser != null) {
                                  Navigator.of(context).pop();
                                  //}
                                } catch (e) {
                                  print(e);
                                }

                                //Navigator.of(context).pop();
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]));
  }
}

// code cited: https://github.com/rajayogan/flutter-minimalloginUI/blob/master/lib/signup.dart
