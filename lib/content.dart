import 'package:flutter/material.dart';
class Content extends StatelessWidget {
  late IconData icon;
  late String text;

  Content({required IconData this.icon,required String this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icon,
          size: 110.0,
        ),

        Center(
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 20.0,

            ),
          ),
        ),
      ],
    );
  }
}