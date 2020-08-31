import 'package:flutter/material.dart';
import 'package:sindhuapp/Pages/Data_entry.dart';
class output extends StatefulWidget {
  String greeting;
  double bmi;
  output({this.greeting,this.bmi});
  @override
  _outputState createState() => _outputState();
}

class _outputState extends State<output> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
        margin:EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
    child:Column(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:<Widget>[
    Text("Your BMI is ",style:TextStyle(fontSize: 35.0,fontFamily: 'Qunado',color:Colors.pinkAccent)),
    Text('${widget.bmi.toStringAsFixed(2)}',style: TextStyle(color: Colors.pink,fontSize: 45.0,fontFamily: 'Quando',fontWeight:FontWeight.w600),),
    Text("${widget.greeting}",style: TextStyle(fontFamily: 'Quando',fontSize: 30,fontWeight: FontWeight.w300,color:Colors.pinkAccent),textAlign: TextAlign.center,),
          ],
    ),
        ),
    );
  }
}