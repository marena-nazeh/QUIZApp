import 'package:flutter/material.dart';
import 'package:quiz_app/data/Questions.dart';

class Result extends StatelessWidget {
const Result(this.selectedAnswers,this.restart,{super.key});

final List <String> selectedAnswers;
final void Function() restart;

List<Map<String, Object>> getSummaryData(){

 final List <Map<String,Object>> summary = [];

 for(var i=0 ; i<selectedAnswers.length ; i++){
        summary.add({
          'Question number':i,
          'question' : questions[i].text,
          'user_answer':selectedAnswers[i],
          'correct_answer':questions[i].answers[0],

        });
 }
   return summary;
}

  @override
  Widget build(BuildContext context) {
    final summarydata =getSummaryData();
    var numOfcorrectanswers =0;
    for(var i=0 ;i<summarydata.length;i++){
        if(summarydata[i]['user_answer'] ==summarydata[i]['correct_answer']){
          numOfcorrectanswers++;
        }
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   Text(
                      'You answered $numOfcorrectanswers out of ${questions.length} questions correctly !',
                      style: const TextStyle(color:Colors.white),
                      textAlign: TextAlign.center,
                    ),
                 
                 const SizedBox(height: 30),
                 ...getSummaryData().map((e) => SingleChildScrollView(
                   child: Column(
                     children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16 ,
                            backgroundColor: 
                              e['user_answer']== e['correct_answer']
                              ? Colors.blue
                              : Colors.red,
                 
                        child:Text(((e['Question number'] as int) +1).toString()),
                      ),
                      const SizedBox(width: 15),
                           Expanded(
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 
                                  Text(
                                    e['question'].toString(),
                                    style: const TextStyle(color:Colors.white),
                                    
                                    ),
                                    const SizedBox(height: 5),
                                   Text(e['user_answer'].toString()),
                                  Text(
                                    e['correct_answer'].toString(),
                                    style: const TextStyle(color:Colors.red),
                                    ),
                                 
                              ],
                             ),
                           ),
                        ],
                      ),
                      const SizedBox(height: 10),
                     ],
                   ),
                 )),
                 const SizedBox(height:30),
                 TextButton.icon(
                  onPressed:restart, 
                  icon: const Icon(Icons.restart_alt_outlined),
                 label:const Text(
                  'Restart Quiz!',
                  style: TextStyle(color:Colors.white),
                 ),
                 ),
                  ],
               ),
    );
  }
}