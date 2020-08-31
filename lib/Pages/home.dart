import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sindhuapp/Animations/FadeAnimation.dart';
import "package:sindhuapp/Pages/QuizPage.dart";
import 'package:sindhuapp/Pages/Data_entry.dart';
import 'package:sindhuapp/Pages/Setup/result.dart';
import 'package:sindhuapp/Pages/listDetail.dart';
import 'package:sindhuapp/Pages/route.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'Setup/Welcome_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: new Icon(Icons.menu),
          actions: <Widget>[
            new Padding(
                padding: EdgeInsets.only(right: 20),
                child: new GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()))
                        });
                  },
                  child: new Icon(Icons.input),
                ))
          ],
          title: Text('HomePage',
              style: TextStyle(fontFamily: 'Quando', fontSize: 25.0,color: Colors.white)),
          elevation: 5.0,
          backgroundColor: Colors.pinkAccent,
          brightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(10.0),
          child:ListView (
            children: <Widget>[
              GestureDetector(
              onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => DataEntry()));
        },
             child: FadeAnimation(1,Container(
                height: 200,
                width: 200,
                child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
                    color: Colors.pink,
                    elevation: 10,
                  child: Center(child: Text('Check Your BMI here!',textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0,fontFamily: 'Quando',color: Colors.white),)),
                ),
              )),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListPage()));
                },
                child: FadeAnimation(2,Container(
                  height: 200,
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.pink,
                    elevation: 10,
                    child: Center(child: Text('Practice Yogasanas!',textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0,fontFamily: 'Quando',color: Colors.white),))),
                  )),
                ),
              GestureDetector(
                onTap: () {},
                child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.pink,
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
