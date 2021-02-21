import 'package:flutter/material.dart';

class Email extends StatelessWidget {
 final Color color;

 Email(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}