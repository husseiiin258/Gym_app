

import 'package:flutter/material.dart';


import '../createaccount/create_account_page.dart';




class OnboardingSecond extends StatelessWidget {


  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CreateAccountPage()));
        },

        backgroundColor: const Color(0xff92A3FD),
        child: const Icon(Icons.arrow_right , size: 40,),
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/Frame.png" ,width: mediaQuery.width,fit: BoxFit.cover,),
          const SizedBox(
            height: 50,
          ),
          const Text("    Track Your Goal" , style: TextStyle(
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
                child:  Text("Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals" , style: TextStyle(
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
          ) ,


        ],
      ),
    );
  }
}