import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymcal/views/Onboarding/onbaording_one.dart';
import 'package:gymcal/views/home/home_page.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void checkLoginStatus() async {

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingFirst()),
        );
      }
    }

    var mediaQuery = MediaQuery.of(context).size;

    Timer(
        const Duration(
          seconds: 3,
        ), () {
      checkLoginStatus();
    });
    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: const Color(0xff92A3FD),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fitness ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
                Text(
                  "X",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Text(
              "Everybody Can Train",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff7B6F72),
              ),
            )
          ],
        ),
      ),
    );
  }
}
