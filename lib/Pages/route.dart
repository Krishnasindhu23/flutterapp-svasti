import 'package:flutter/material.dart';
import 'package:sindhuapp/Pages/Data_entry.dart';
import 'listDetail.dart';
class route extends StatefulWidget {
  @override
  _routeState createState() => _routeState();
}

class _routeState extends State<route> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Health master'),
      ),
        body:ListView(
          children:<Widget>[
            Text('Welcome..!',style:TextStyle(fontFamily:'Quando',fontSize: 30,fontWeight: FontWeight.w300,color: Colors.white),textAlign: TextAlign.center,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>DataEntry()
                ));
              },
              child:Container(
                margin: EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlue,
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      offset: Offset(4.0, 4.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Image(
                  image:AssetImage(
                    "images/bmi.jpg",
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>ListPage()
                ));
              },
              child:Container(
                margin: EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlue,
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      offset: Offset(4.0, 4.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Image(
                  image:AssetImage(
                    "images/tips.jpg",
                  ),
                ),
              ),
            ),
          ],
          scrollDirection:Axis.vertical,
        )

    );
  }
}
