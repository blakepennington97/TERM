import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Email extends StatelessWidget {
  final Color color;

  Email(this.color);

  get child => null;

  void _launchEmail(String emailId) async {
    var url = "mailto:$emailId?subject = Hello World Email";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not send e-mail';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          //child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 45.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                        minimumSize: MaterialStateProperty.all(Size(250, 150)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                      ),
                      child: Text(
                        'Send Email',
                        style: TextStyle(fontSize: 40),
                      ),
                      onPressed: () {
                        _launchEmail('sample@gmail.com');
                      }),
                ),
              ]),
        ));
  }
}
