import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './frontEnd/welcomeScreen/welcome_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return AnimatedSplashScreen(
              splash: 'images/hmlogo2.jpg',
              nextScreen: WelcomeScreen(),
              // nextScreen: SignIn(),
              splashTransition: SplashTransition.rotationTransition,
              // pageTransitionType: PageTransitionT.scale,
            );
          }
          return Container();
        },
      ),
    );
  }
}
