import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gym_app/views/Onboarding/onbaording_one.dart';




class SplashScreen extends StatelessWidget {
  static const String routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingFirst()));
    });
    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: const Color(0xff92A3FD),
        child:  const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
           Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fitness " , style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                ),) ,
                Text("X" , style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),)
              ],
            )
          ,
          Text("Everybody Can Train" , style: TextStyle(
            fontSize: 18,
            color: Color(0xff7B6F72),
          ),)
        ],),
      ),
    );
  }
}