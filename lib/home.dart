import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   const Home(this.SwitchScreen ,{super.key});
   

   
final void Function () SwitchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
             child:Column(
              mainAxisSize:MainAxisSize.min,
                children: [
                  Image.asset('assets/images/pngegg.png',width: 300),
                  const SizedBox(height: 80),
                  const Text('learn flutter' ,style: TextStyle(fontSize: 26,color: Colors.black
                  ),
                  ),
                  const SizedBox(height:50),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    onPressed: SwitchScreen, 
                    icon:const Icon(Icons.arrow_right_alt_outlined),
                    label: const Text('Start Quiz'),
                   ),
                ],
             ),
      );
  }
}