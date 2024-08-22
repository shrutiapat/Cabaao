import 'package:cabaao/main_screen.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        '/':(context) =>  SplashScreen(),
        '/main':(context) =>  MainScreen(),
    },
    );
  }
}

