import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isShowingMainData = true;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    final User user = auth.currentUser;
    String emailStr = 'Email: ' + user.email;
    String nameStr = 'Name: ' + user.displayName;

    double c_width = MediaQuery.of(context).size.width * 0.95;
    double c_height = MediaQuery.of(context).size.height * 0.07;

    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
              //SizedBox(height: 270.0),
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
                  child: Column(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.red.shade900,
                        padding: EdgeInsets.all(10),
                        width: c_width,
                        height: c_height,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            nameStr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey.shade100,
                                //decoration: TextDecoration.underline,
                                //fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(padding: EdgeInsets.all(7)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.red.shade900,
                        padding: EdgeInsets.all(10.0),
                        width: c_width,
                        height: c_height,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            emailStr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey.shade100,
                                //decoration: TextDecoration.underline,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(17),
                    ),
                    Text(
                      'My Pregnancy Goals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[800],
                          decoration: TextDecoration.underline,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: "#1",
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade900))),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: "#2",
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade900))),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: "#3",
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade900))),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: "#4",
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade900))),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: "#5",
                          labelStyle: TextStyle(color: Colors.grey[800]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade900))),
                    ),
                  ]))
            ])));
  }
}
