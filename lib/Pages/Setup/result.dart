import 'package:flutter/material.dart';
import 'package:sindhuapp/Pages/QuizPage.dart';
import 'package:sindhuapp/Pages/home.dart';
class Result extends StatefulWidget {

  int score,totalQuestion,  correct,incorrect,notattempted;
  Result({this.score,this.totalQuestion,this.correct,this.incorrect,this.notattempted});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting="";
  @override
  void initState(){
    super.initState();
    var percentage=(widget.score/(widget.totalQuestion*20))*100;
    if(percentage>=90){
      greeting="OutStanding Performance";
    }
    else if(percentage>80 && percentage<90){
      greeting='Well Done!';
    }
    else if(percentage>70 && percentage<80){
      greeting='Good Effort';
    }
    else if(percentage<70){
      greeting='Needs Improvement';
    }


  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        margin:EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Text("$greeting",style: TextStyle(fontFamily: 'Quando',fontSize: 30,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
            Text('You scored ${widget.score} out of ${widget.totalQuestion*20}',style: TextStyle(fontFamily: 'Quando',fontSize: 25,fontWeight: FontWeight.w300,),textAlign: TextAlign.center,),
            Text("${widget.correct} Correct, ${widget.incorrect} Incorrect & ${widget.notattempted} out of ${widget.totalQuestion} not attempted",style: TextStyle(fontFamily: 'Quando',fontSize: 20,fontWeight: FontWeight.w300,),textAlign: TextAlign.center,),
            GestureDetector(
              onTap:() {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder:(context)=>QuizPage()
                ));

              },
              child: Container(
                margin:EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                padding: EdgeInsets.symmetric(vertical:15.0,horizontal: 54.0),
                child: Text("Play the quiz again?",style: TextStyle(fontFamily: 'Quando',fontSize: 18,color: Colors.white,fontWeight: FontWeight.w300),),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.indigo
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap:() {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder:(context)=>Home()
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical:15.0,horizontal: 54.0),
                child: Text("Go to home",style: TextStyle(fontFamily: 'Quando',fontSize: 18, color: Colors.indigo,fontWeight: FontWeight.w300),),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(color:Colors.indigo,width: 2.0)
                ),
              ),
            ),
          ]
      ),

      ),

    );
  }
}
