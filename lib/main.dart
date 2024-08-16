import 'package:flutter/material.dart';
import 'bmi.dart';
void main(){
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple,
          shape: CircleBorder(),
        ),
        appBarTheme: AppBarTheme(
            color:  Color(0xFF0A0E21),
            titleTextStyle: TextStyle(
              color: Colors.white,
            )
        ),
        scaffoldBackgroundColor:Color(0xFF0A0E21),
        textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
            )
        )
    ),
    home: Bmi(),
  ));
}


