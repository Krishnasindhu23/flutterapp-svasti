import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sindhuapp/Pages/home.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  String error=" ";
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text('SignIn',style:TextStyle(fontFamily:'Quando')),
          backgroundColor: Colors.pinkAccent,
        ),
        backgroundColor: Colors.pink,
        body:Form(
          key:_formKey,
          child:Container(
            padding:EdgeInsets.all(20.0),
            color:Colors.white,
            margin:EdgeInsets.symmetric(horizontal: 24.0,vertical: 64.0),
            child: Column(
              children:<Widget>[
                TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return 'Please type an email';
                    }
                  },
                  onSaved:(input)=>_email=input,
                  decoration: InputDecoration(
                    labelText:'Email',
                    labelStyle: TextStyle(color:Colors.pinkAccent),
                    icon:Icon(Icons.email,color: Colors.pink,),
                  ),
                ),
                TextFormField(
                  validator: (input){
                    if(input.length<6){
                      return 'Your password needs to be atleast 6 characters';
                    }
                  },
                  onSaved:(input)=>_password=input,
                  decoration: InputDecoration(
                    labelText:'Password',
                    labelStyle: TextStyle(color:Colors.pinkAccent),
                    icon:Icon(Icons.lock,color: Colors.pink,),
                  ),
                  obscureText:true,
                ),
                Padding(padding:EdgeInsets.all(10.0)),
                Column(
                  children: [
                    RaisedButton(
                        child:Text('Sign in',style: TextStyle(fontSize:20.0,color:Colors.white,fontFamily: 'Quando')),
                        color: Colors.pink,
                        onPressed:()async{
                          final formState= _formKey.currentState;
                          if(formState.validate()){
                            formState.save();
                            try{
                              FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            }catch(e) {
                              print(e.message);
                              setState(() {
                                error=e.message;
                              });
                            }
                          }
                        }
                    ),
                    Text('$error',style: TextStyle(color: Colors.pinkAccent,fontSize: 14.0),),

                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
 /* Future < FirebaseUser > signIn(String email, String password) async {
    try {
      FirebaseUser user = await auth.signInWithEmailAndPassword(email: email, password: password);
      assert(user != null);
      assert(await user.getIdToken() != null);
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      return user;
    } catch (e) {
    print(e.message);
    return null;
    }
  }
*/