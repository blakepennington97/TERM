import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
 final Color color;

 Progress(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}