import 'package:flutter/material.dart';
import 'package:sindhuapp/Pages/output.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataEntry extends StatefulWidget {
  @override
  _DataEntryState createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  double result;
  String message;
  TextEditingController ageController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  void _calculateBMI()
  {
    double weight=double.parse(weightController.text);
    double height=double.parse(heightController.text);
    if(height!=null && weight!=null){
      result=(weight/(height*height));
    }
    if(result<18.5){
      message='Underweight';
    }
    else if(result>=18.5 && result<=24.9){
      message='Yayy! You are healthy!Maintain this...';
    }
    else if(result>=25.0 && result<=29.9){
      message='Oops! You are overweight...';
    }
    else{
      message='Oops!You are obese';
    }
    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>output(
        greeting: message,
      bmi:result,
    )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar:AppBar(
            title:Text('Fitness Freak(BMI Calculator)',style:TextStyle(fontFamily:'Quando',color: Colors.white)),
          backgroundColor: Colors.pink,
            ),
        backgroundColor: Colors.pinkAccent,
        body:Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.white,
            margin:EdgeInsets.symmetric(horizontal: 44.0,vertical: 84.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: "Enter your weight in kgs",labelStyle: TextStyle(color:Colors.pinkAccent),
                  icon:Icon(Icons.shutter_speed,color: Colors.pinkAccent),
                  ),
                ),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: "Enter your height in metres",labelStyle: TextStyle(color:Colors.pinkAccent),
                    icon:Icon(Icons.info,color: Colors.pinkAccent,),
                  )
                ),
                Padding(padding:EdgeInsets.all(10.0)),
                  RaisedButton(onPressed: _calculateBMI,
                    child: Text("SUBMIT",style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Quando',fontSize: 20.0,color: Colors.white)),
                    color:Colors.pinkAccent
                    ,)
              ],
            )),
      ),
    );
  }
}

