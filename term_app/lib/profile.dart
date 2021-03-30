import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isShowingMainData = true;
  var nameStr = 'Name: ' + globals.uFirst + ' ' + globals.uLast;
  var emailStr = 'Email: ' + globals.uEmail;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
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
                      top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          nameStr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey[800],
                              //decoration: TextDecoration.underline,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
                        child: Text(
                          emailStr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey[800],
                              //decoration: TextDecoration.underline,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
