
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/Questions.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<Quiz> {
   List<String> selectedAnswers =[];
 Widget? activeScreen ;

void chooseAnswer(String answer){
    log(answer);
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen =  Result(selectedAnswers,restart);
      });
       
    }

    log(selectedAnswers.toString());
}

void restart (){
  setState(() {
    selectedAnswers =[];
 activeScreen = Home(SwitchScreen);
  });

}


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
     activeScreen = Home(SwitchScreen);

  }


void SwitchScreen(){
  setState(() {
    activeScreen = question(chooseAnswer);
  });
  
}



  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home:Scaffold(
        body:Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurpleAccent,
              Colors.purple,
            ])
          ),
          child:activeScreen,
        )
      )
    );
  }
}
  