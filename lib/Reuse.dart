
import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  late Color color;
  late Widget cardChild;
  late VoidCallback button;

  ReusableCard({required Color color, required Widget cardChild,required VoidCallback button}) {
    this.color = color;
    this.cardChild = cardChild;
    this.button=button;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: button,
      child: Container(
        child: cardChild,
        height: 200.0,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
