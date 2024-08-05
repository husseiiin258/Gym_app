
import 'package:flutter/material.dart';
import 'package:gym_app/services/auth/auth_service.dart';
import 'package:gym_app/views/complete_profile/components/email_textformfield_complete_profile.dart';
import 'package:gym_app/views/complete_profile/components/firtsname_textformfiled_complete_profile.dart';
import 'package:gym_app/views/complete_profile/components/next_buuton_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/password_textformfield_complete_profile.dart';
import 'package:gym_app/views/complete_profile/components/your_height_textformfield_complete_profile_page.dart';
import 'package:gym_app/views/complete_profile/components/your_weight_textformfield_complete_profile_page.dart';
import 'package:gym_app/views/Login/login_page.dart';

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
        FirtsnameTextformfiledCompleteProfile.firstnameController.text,
        YourWeightTextformfieldCompleteProfilePage.weightController.text,
        YourHeightTextformfieldCompleteProfilePage.heightController.text,
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up successful: ${user.email}')),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginPage()));
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
                          icon: const Icon(Icons.arrow_back_ios))
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
                  SizedBox(height: height * .01),
                  NextBuutonCompleteProfilePage(),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/google.png",
                          width: width * .13,
                        ),
                      ),
                      SizedBox(width: width * .05),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/facebook.png",
                          width: width * .13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

