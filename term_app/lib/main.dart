/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:term_app/home.dart';
import 'signup.dart';
import 'globals.dart' as globals;

void main() => runApp(new SignIn());

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/home': (BuildContext context) => new Home()
      },
      home: new SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInState createState() => new _SignInState();
}

class _SignInState extends State<SignInPage> {
  TextEditingController userEmail = new TextEditingController();
  TextEditingController userPassword = new TextEditingController();

  bool valEmail = false;
  bool valPassword = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(5.0, 140.0, 5.0, 0.0),
                      child: Image(
                        image: AssetImage('assets/term.png'),
                      ))
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 75.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: userEmail,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          errorText: valEmail ? 'Email not found' : null,
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: userPassword,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          errorText: valPassword ? 'Wrong password' : null,
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                      obscureText: true,
                    ),
                    SizedBox(height: 35.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.grey[800],
                        color: Colors.red.shade900,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              (userEmail.text == globals.uEmail)
                                  ? valEmail = false
                                  : valEmail = true;
                              ((userEmail.text == globals.uEmail) &&
                                      (userPassword.text != globals.uPassword))
                                  ? valPassword = true
                                  : valPassword = false;
                            });
                            if ((userEmail.text == globals.uEmail) &&
                                (userPassword.text == globals.uPassword)) {
                              Navigator.of(context).pushNamed('/home');
                            }
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20.0),
            Container(
              height: 40.0,
              padding: EdgeInsets.only(right: 19.0, left: 19.0),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.grey[800],
                color: Colors.red.shade900,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Center(
                    child: Text(
                      'CREATE PROFILE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

// code cited: https://github.com/rajayogan/flutter-minimalloginUI/blob/master/lib/main.dart
