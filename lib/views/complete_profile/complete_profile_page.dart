// import 'package:flutter/material.dart';
// import 'package:gym_app/services/auth/auth_service.dart';
// import 'package:gym_app/views/Login/login_page.dart';

// import 'package:gym_app/views/complete_profile/components/email_textformfield_complete_profile.dart';
// import 'package:gym_app/views/complete_profile/components/firtsname_textformfiled_complete_profile.dart';
// import 'package:gym_app/views/complete_profile/components/next_buuton_complete_profile_page.dart';
// import 'package:gym_app/views/complete_profile/components/password_textformfield_complete_profile.dart';
// import 'package:gym_app/views/complete_profile/components/your_height_textformfield_complete_profile_page.dart';
// import 'package:gym_app/views/complete_profile/components/your_weight_textformfield_complete_profile_page.dart';

// class CompleteProfilePage extends StatelessWidget {
//   CompleteProfilePage({super.key});

//   final AuthService _authService = AuthService();

//   void signUp() async {
//     final user = await _authService.signUpWithEmailPassword(
//         EmailTextformfieldCompleteProfile.emailController.text,
//         PasswordTextformfieldCompleteProfile.passwordController.text,
//         FirtsnameTextformfiledCompleteProfile.nameController.text,
//         YourWeightTextformfieldCompleteProfilePage.heightController.text,
//         YourHeightTextformfieldCompleteProfilePage.heightController.text);
//     if (user != null) {
//       // Navigate to another page or show a success message
//       print('Sign up successful: ${user.email}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     double height = MediaQuery.sizeOf(context).height;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     "assets/images/completeprofile.png",
//                     fit: BoxFit.cover,
//                   )
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Let’s complete your profile",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "It will help us to know more about you!",
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: height * .05,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width * .03, right: width * .03),
//                 child: Column(
//                   children: [
//                      FirtsnameTextformfiledCompleteProfile(),
//                     SizedBox(
//                       height: height * .02,
//                     ),
//                      EmailTextformfieldCompleteProfile(),
//                     SizedBox(
//                       height: height * .02,
//                     ),
//                      PasswordTextformfieldCompleteProfile(),
//                     SizedBox(
//                       height: height * .02,
//                     ),
//                      YourWeightTextformfieldCompleteProfilePage(),
//                     SizedBox(
//                       height: height * .02,
//                     ),
//                      YourHeightTextformfieldCompleteProfilePage(),
//                     SizedBox(
//                       height: height * .07,
//                     ),
//                      NextBuutonCompleteProfilePage(),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gym_app/services/auth/auth_service.dart';
import 'package:gym_app/views/Login/login_page.dart';
import 'package:gym_app/views/complete_profile/components/email_textformfield_complete_profile.dart';
import 'package:gym_app/views/complete_profile/components/firtsname_textformfiled_complete_profile.dart';
import 'package:gym_app/views/complete_profile/components/next_buuton_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/password_textformfield_complete_profile.dart';
import 'package:gym_app/views/complete_profile/components/your_height_textformfield_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/your_weight_textformfield_complete_profile_page.dart';

class CompleteProfilePage extends StatefulWidget {
  CompleteProfilePage({super.key});

  @override
  CompleteProfilePageState createState() => CompleteProfilePageState();
}

class CompleteProfilePageState extends State<CompleteProfilePage> {
  final formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  void signUp() async {
    if (formKey.currentState?.validate() ?? false) {
      final user = await _authService.signUpWithEmailPassword(
        EmailTextformfieldCompleteProfile.emailController.text,
        PasswordTextformfieldCompleteProfile.passwordController.text,
        FirtsnameTextformfiledCompleteProfile.nameController.text,
        YourWeightTextformfieldCompleteProfilePage.weightController.text,
        YourHeightTextformfieldCompleteProfilePage.heightController.text,
      );

      if (user != null) {
        // Navigate to another page or show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up successful: ${user.email}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/completeprofile.png",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let’s complete your profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "It will help us to know more about you!",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  FirtsnameTextformfiledCompleteProfile(),
                  SizedBox(height: height * .02),
                  EmailTextformfieldCompleteProfile(),
                  SizedBox(height: height * .02),
                  PasswordTextformfieldCompleteProfile(),
                  SizedBox(height: height * .02),
                  YourWeightTextformfieldCompleteProfilePage(),
                  SizedBox(height: height * .02),
                  YourHeightTextformfieldCompleteProfilePage(),
                  SizedBox(height: height * .07),
                  NextBuutonCompleteProfilePage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
