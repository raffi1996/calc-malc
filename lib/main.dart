import 'package:flutter/material.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key ?key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String userInput = '';
  String answer = ' ';

  final List<String> members = <String>[
      
      'C',
      '+/-',
      '%',
      '/',
      '7',
      '8',
      '9',
      'x',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '0',
      '.',
      '=',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      
      backgroundColor: Colors.blue,
      
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  //InputTitle
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  //Answer
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                   )
                ],
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
        
                ),
                itemCount: members.length,
                itemBuilder: (BuildContext ctx,int index){

                    if(index == 0){
                      return MyButtons(
                        click: (){
                          setState((){
                             userInput = '';
                             answer = '0';   
                          });
                        },

                        buttonText: members[index],
                        color: Colors.blue,
                      );
                    }
                    else if(index == 1){
                      return MyButtons(
                        buttonText: members[index],
                        color: Colors.blue,
                     );
                    }
                    else if(index == 2){
                      return MyButtons(
                        click: (){
                          setState(() {
                            userInput += members[index];
                            nonRepeatingCharacter();
                          });
                        },
                        buttonText: members[index],
                        color: Colors.blue,
                      );
                    }
                    else if(index == members.length - 1){
                      return MyButtons(
                        click: (){
                          setState(() {
                            calculate();
                          });
                        },
                        buttonText: members[index],
                        color: Colors.blue,
                      );
                    }

                    else {
                      return MyButtons(
                        click: () {
                          setState(() { 
                            userInput += members[index];
                            nonRepeatingCharacter();
                          });
                        },

                        color: Colors.blue,
                        buttonText: members[index],
                      );
                    }
                  
                },
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
      
    );
  }


  void nonRepeatingCharacter(){
    if(userInput[userInput.length - 1] == "/" && userInput[userInput.length - 2] == "/"){
        userInput = userInput.substring(0,userInput.length -1);
    }
    else if(userInput[userInput.length - 1] == "x" && userInput[userInput.length - 2] == "x"){
        userInput = userInput.substring(0,userInput.length -1);
    }
    else if(userInput[userInput.length - 1] == "+" && userInput[userInput.length - 2] == "+"){
        userInput = userInput.substring(0,userInput.length -1);
    }
    else if(userInput[userInput.length - 1] == "-" && userInput[userInput.length - 2] == "-"){
        userInput = userInput.substring(0,userInput.length -1);
    }
    else if(userInput[userInput.length - 1] == "+" && userInput[userInput.length - 2] == "+"){
        userInput = userInput.substring(0,userInput.length -1);
    }
    else if(userInput[userInput.length - 1] == "." && userInput[userInput.length - 2] == "."){
        userInput = userInput.substring(0,userInput.length -1);
    }
    else if(userInput[userInput.length - 1] == "%" && userInput[userInput.length - 2] == "%"){
        userInput = userInput.substring(0,userInput.length -1);
    }
    
  }



  void calculate(){
    String newUsersInput = userInput;
    newUsersInput = userInput.replaceAll('x', '*');
    
    Parser chlp = Parser();

    Expression exp = chlp.parse(newUsersInput);
    ContextModel cm = ContextModel();
    num evaluationNumber = exp.evaluate(EvaluationType.REAL, cm);

    
    userInput = evaluationNumber.toString();

    answer = evaluationNumber.toString();
  }

}

