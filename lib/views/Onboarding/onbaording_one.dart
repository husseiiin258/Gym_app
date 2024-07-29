import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_app/views/Login/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';




class OnboardingFirst extends StatelessWidget {
  static const String routeName = "splash-screen";

  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    /* Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });*/
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/Group (2).png" ,width: mediaQuery.width,fit: BoxFit.cover,)

        ],
      ),
    );
  }
}