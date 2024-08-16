import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';


class Result extends StatelessWidget {
  late String result;
  late String verdict;
  late String feed;


  Result({required String this.result,required String this.verdict,required String this.feed});
  
  
  @override
  Widget build(BuildContext context) {

    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Bmi Calculator",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                  "Your Results",
                style: TextStyle(
                  fontSize: 50
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),

                  color: customcolor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          feed,
                        style: TextStyle(
                          fontSize: 29,
                          color: Colors.green
                        ),
                      ),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 70
                        ),
                      ),
                      Text(
                          verdict,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),

                ),
              ),
              Container(
                height: 90,
                color: bottom,
                width: double.infinity,
                margin:EdgeInsets.all(10),
                child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                        "RE-GENERATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:23,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              )

            ],

          )
        )
    );
  }
}
