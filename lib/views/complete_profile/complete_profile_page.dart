import 'package:flutter/material.dart';

import 'package:gym_app/views/complete_profile/components/choose_gender_textformfield_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/date_of_birth_textformfield_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/next_buuton_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/your_height_textformfield_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/your_weight_textformfield_complete_profile_page.dart';

class CompleteProfilePage extends StatelessWidget {
  CompleteProfilePage({super.key});

 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/completeprofile.png",
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let’s complete your profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It will help us to know more about you!",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * .03, right: width * .03),
                child: Column(
                  children: [
                    const ChooseGenderTextformfieldCompleteProfilePage(),
                    
                    SizedBox(
                      height: height * .02,
                    ),
                    const DateOfBirthTextformfieldCompleteProfilePage(),
                    SizedBox(
                      height: height * .02,
                    ),
                    const YourWeightTextformfieldCompleteProfilePage(),
                    
                    SizedBox(
                      height: height * .02,
                    ),
                    const YourHeightTextformfieldCompleteProfilePage(),
                    SizedBox(
                      height: height * .07,
                    ),
                    const NextBuutonCompleteProfilePage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
