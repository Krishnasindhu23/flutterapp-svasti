import 'package:flutter/material.dart';
import 'package:sindhuapp/Animations/FadeAnimation.dart';
import 'package:sindhuapp/Pages/Setup/signIn.dart';
import 'package:sindhuapp/Pages/Setup/signUp.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sindhuapp/Pages/home.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        //   margin:EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 350,
            ),
            SizedBox(height: 40.0,),
            FadeAnimation(
                2,
                Container(
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: navigateToSignIn,
                    child: Text('Sign In',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.pink,
                            fontFamily: 'Quando')),
                    color: Colors.white,
                  ),
                )),
            Center(
              child: FadeAnimation(
                2,
                Container(
                  //height: 30.0,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Don't have an account?",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'Quando')),
                ),
              ),
            ),
            FadeAnimation(
                3,
                Container(
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: navigateToSignUp,
                    child: Text('Create an Account',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.pink,
                            fontFamily: 'Quando')),
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void navigateToSignIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void navigateToSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  void checkUserPersistence() async {
    var currentUser = await FirebaseAuth.instance.currentUser();
    print(currentUser);
    // working..      what did u check
    // becasue he logged in now.. we can access home directly..okay..got it
    // persistence is for ux.. we cant prompt user to login everytym know..yes..
    if (currentUser != null)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    checkUserPersistence();
  }
}
