class Output{
  late double height;
  late int weight;

  Output({required double this.height,required int this.weight});

  double getBmi(){
    return (weight/((height/100)*(height/100)));
  }

  String getFeed(){
    if(getBmi()>=25){
      return "OverWeight";
    }else if(getBmi()>18.5){
      return "Normal";
    }else{
      return "Underweight";
    }
  }

  String verdict(){
    if(getBmi()>=25){
      return "You have a higher than the normal body weight, try to excercise more";
    }else if(getBmi()>18.5){
      return "You have a normal body weight";
    }else{
      return "You have a lower than mormal body weight";
    }
  }
}