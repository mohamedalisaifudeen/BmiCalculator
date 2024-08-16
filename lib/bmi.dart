import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'cardTxt.dart';
import 'Reuse.dart';
import 'content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'const.dart';
import 'results.dart';
import 'output.dart';

enum Gender {
  male,
  female,
}
class Bmi extends StatefulWidget {

  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}
class _BmiState extends State<Bmi> {
  static const TextStyle number=TextStyle(
    fontSize: 55.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle term=TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );
  static Color maleColor=inactive;
  static Color femaleColor=inactive;
  double _sliderVal=120;
  static const newButtonstyle= ButtonStyle(
      backgroundColor:MaterialStatePropertyAll<Color>(
        Color(0xFF4C4F5E)      ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
          CircleBorder(
            side: BorderSide.none,
            eccentricity: 0.1,

          )
      )
  );

  int age=12;
  int weight=60;


  void Choice({required Gender gender}){
    if(Gender.male==gender){
      maleColor==inactive?maleColor=customcolor:maleColor=inactive;
      femaleColor=inactive;
  }else if(Gender.female==gender){
      femaleColor==inactive?femaleColor=customcolor:femaleColor=inactive;
      maleColor=inactive;
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bmi Calculator"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child:ReusableCard(
                                        color:maleColor,
                                        cardChild: Content(
                      icon:Icons.male,
                      text: "Male",
                                        ),
          button: (){
                                          setState(() {
                                            Choice(gender: Gender.male);
                                          });

          },

                                        ),
                                      ),
                Expanded(
                  child:ReusableCard(
                      color: femaleColor,
                      cardChild: Content(
                        icon: Icons.female,
                        text: "Female",
                      ),
                    button:(){
                        setState(() {
                          Choice(gender: Gender.female);
                        });
                    }


                    ),


                )
              ],
            ),
            Expanded(
              child: ReusableCard(
                color: customcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                            'Height',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )
                    ),
                    Center(
                        child: Text(
                            _sliderVal.round().toString()+' cm',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                    Center(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: bottom,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),

                        child: Slider(
                            value: _sliderVal,
                            thumbColor: bottom,
                            activeColor: bottom,
                            min:120,
                            max: 300,
                            onChanged: (double value){
                              setState(() {
                                _sliderVal=value;
                              });
                            }
                        ),
                      ),
                    )
                  ],
                ),
                button: (){

                },
                
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: customcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cardTxt(txt: "Weight",
                          FontStyle: term,
                        ),
                        cardTxt(txt: weight.toString(),
                          FontStyle:number,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconBtn(
                                newButtonstyle: newButtonstyle,
                              iconTyp: Icons.add,
                                btn: (){
                                  setState((){
                                    weight+=1;
                                  });

                                },
                            ),
                            iconBtn(
                              newButtonstyle: newButtonstyle,
                              iconTyp: Icons.remove,
                              btn:(){
                                setState((){
                                  if(weight>0){
                                    weight-=1;
                                  }
                                });
                              }
                            ),

                          ],

                        )
                      ],
                    ),
                    button: (){

                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: customcolor,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cardTxt(txt: "Age",
                          FontStyle:term,
                        ),
                        cardTxt(txt: age.toString(),
                          FontStyle:number,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconBtn(
                              newButtonstyle: newButtonstyle,
                              iconTyp: Icons.add,
                              btn:(){
                                setState((){
                                  age+=1;
                                });
                              }
                            ),
                            iconBtn(
                              newButtonstyle: newButtonstyle,
                              iconTyp: Icons.remove,
                              btn: (){
                                setState((){
                                  if(age>0){
                                    age-=1;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    button: (){

                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                Output out=Output(height:_sliderVal, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Result(result: out.getBmi().toStringAsFixed(1),feed: out.getFeed(),verdict: out.verdict(),)));
              },
              child: Container(
              width: double.infinity,
                color:bottom,
                child: Center(
                  child: Text(
                      "Get Results",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 100.0,
                margin: EdgeInsets.all(10),
              ),
            ),
          ],
        ));
  }
}

class iconBtn extends StatelessWidget {
  final ButtonStyle newButtonstyle;
  late IconData iconTyp;
  late VoidCallback btn;

  iconBtn({required ButtonStyle this.newButtonstyle,required IconData this.iconTyp, required VoidCallback this.btn});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: newButtonstyle,
        onPressed: btn,
        child:Icon(
          iconTyp,
          color: Colors.white,
          size:32,

        ));
  }
}






