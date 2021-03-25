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
            child: Center(
          child: Column(children: <Widget>[
            ElevatedButton(
                child: Text('Send Email'),
                onPressed: () {
                  _launchEmail('sample@gmail.com');
                }),
            SizedBox(
              height: 20.0,
            ),
          ]),
        )));
  }
}
