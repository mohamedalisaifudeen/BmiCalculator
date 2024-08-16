import 'package:flutter/material.dart';
class cardTxt extends StatelessWidget {
  String txt;
  TextStyle FontStyle;

  cardTxt({required String this.txt,required TextStyle this.FontStyle });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style:FontStyle,
    );
  }
}