import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sindhuapp/Pages/Setup/Welcome_page.dart';
import 'package:sindhuapp/Pages/Setup/signIn.dart';
import 'package:sindhuapp/Pages/home.dart';
import 'package:sindhuapp/Pages/listDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
    debugShowCheckedModeBanner: false,
    theme:ThemeData(
    primarySwatch:Colors.blue,
    ),
      home:WelcomePage(),
    );
  }
}