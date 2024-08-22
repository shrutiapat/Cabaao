// splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // Importing main.dart for MyApp widget
import 'main_screen.dart'; // Importing MainScreen widget

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, "/main")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Center(
          child:Image.asset("assets/cabaao_logo.png")
        )
    );
  }
}
