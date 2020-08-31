import'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sindhuapp/Pages/Setup/signIn.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp', style: TextStyle(fontFamily: 'Quando')),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.pink,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type an email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color:Colors.pinkAccent),
                  icon: Icon(Icons.email,color: Colors.pinkAccent,),
                ),
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Your password needs to be atleast 6 characters';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color:Colors.pinkAccent),
                  icon: Icon(Icons.lock,color: Colors.pinkAccent,),
                ),
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                onPressed: () async{
                    final formState= _formKey.currentState;
                    if(formState.validate()){
                      formState.save();
                      try{
                        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
                  user.sendEmailVerification();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> display()));

                  }catch(e){
                  print(e.message);
                  }
                }
                },
                child: Text('Sign Up', style: TextStyle(fontSize: 20.0,color: Colors.white,fontFamily: 'Quando')),
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Your account has been created successfully!"),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> LoginPage()));
          },
        ),
      ],
    );
  }
}

