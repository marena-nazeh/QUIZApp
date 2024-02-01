import 'package:flutter/material.dart';

import 'answer_button.dart';
import 'data/Questions.dart';


class question extends StatefulWidget {
  const question(this.onselectedAnswer,{super.key});

  final void Function(String) onselectedAnswer;

  @override
  State<question> createState() => _questionsState();
}

class _questionsState extends State<question> {
  var currentquestionindex =0;

  void answerquestion (String answer){
    widget.onselectedAnswer(answer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CurrentQuestion =questions[currentquestionindex];
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      CurrentQuestion.text,
                      style: const TextStyle(color:Colors.white),
                      textAlign: TextAlign.center,
                    ),
                 
                 ...CurrentQuestion.getShuffledAnswer().map(
                  (e) {
                         return Container(child: AnswerButton(
                          answerText:e ,
                           onPressed: ()=> answerquestion(e),
                           ),
                         margin:const EdgeInsets.all(10),
                         );
                  },
                 ),
                
                  ],
               ),
    );
  }
}