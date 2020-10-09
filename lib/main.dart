import 'package:flutter/material.dart';
import 'package:helpify/homeScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      splash: Image(image: AssetImage('assets/apple_progress_bar.gif')),
      backgroundColor: Colors.black,
      nextScreen: HomeScreen(),
      duration: 500,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200,
    ),  
  ));
}