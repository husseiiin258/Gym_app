

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:gym_app/views/Onboarding/onboarding_two.dart';




class OnboardingFirst extends StatelessWidget {
  static const String routeName = "splash-screen";

  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingSecond()));
        },

        backgroundColor: const Color(0xff92A3FD),
        child: const Icon(Icons.arrow_right , size: 40,),
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/Group (2).png" ,width: mediaQuery.width,fit: BoxFit.cover,),
          const SizedBox(
            height: 50,
          ),
          const Text("    Get Burn" , style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ), textAlign: TextAlign.start,) ,
          const SizedBox(
            height: 20,
          ),
          
        const Row(
           children: [
              SizedBox(
               width: 15,
             ),
              Expanded(
               child:  Text("Let’s keep burning, to achive yours goals,"
                    " it hurts only temporarily,"
                    " if you give up now you will be in pain forever" , style: TextStyle(
                  color: Color(0xff7B6F72),
                  fontSize: 18,
                 height: 2
                ), textAlign: TextAlign.start,
               ),
             ),
              SizedBox(
               width: 15,
             ),
           ],
         )

        ],
      ),
    );
  }
}