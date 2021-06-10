import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButtons extends StatelessWidget{
  final String buttonText;
  final click;
  final color;
  final containerColor;
  MyButtons({this.buttonText = " ", this.click, this.color,this.containerColor});


  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: click,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          child: Container(
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: color,fontSize: 33,fontWeight: FontWeight.bold,),
                
              ),
            ),
           ),
        )
        
      ),
    );
  }

}