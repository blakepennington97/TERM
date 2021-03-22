import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 290.0),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'MY PREGNANCY GOALS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[800],
                          decoration: TextDecoration.underline,
                          fontSize: 27,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: "#1",
                            labelStyle: TextStyle(
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]))),
                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: "#2",
                            labelStyle: TextStyle(
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]))),
                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: "#3",
                            labelStyle: TextStyle(
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]))),
                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: "#4",
                            labelStyle: TextStyle(
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]))),
                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: "#5",
                            labelStyle: TextStyle(
                                color: Colors.grey[800]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red[900]))),
                      ),
    ]
    )
    )
    ]
    )
    );
 }
}