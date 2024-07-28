import 'package:flutter/material.dart';
import 'package:gym_app/views/Login/components/email_textFormField_login_page.dart';
import 'package:gym_app/views/Login/components/first_name_textFormField_login_page.dart';
import 'package:gym_app/views/Login/components/last_name_textFormField_login_page.dart';
import 'package:gym_app/views/Login/components/password_textFormField_login_page.dart';
import 'package:gym_app/views/Login/components/register_button_login_page.dart';
import 'package:gym_app/views/Login/components/social_media_buttons_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              top: height * .04, left: width * .08, right: width * .08),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create an account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: height * .06,
              ),
              const FirstNameTextformfieldLoginPage(),
              SizedBox(
                height: height * .02,
              ),
              const LastNameTextformfieldLoginPage(),
              SizedBox(
                height: height * .02,
              ),
              const EmailTextformfieldLoginPage(),
              SizedBox(
                height: height * .02,
              ),
              const PasswordTextformfieldLoginPage(),
              SizedBox(
                height: height * .2,
              ),
              const RegisterButtonLoginPage(),
              SizedBox(height: height*.01,),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey, 
                      thickness: 1.0, 
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Or",style: TextStyle(color: Colors.grey),),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*.04,),
              const SocialMediaButtonsLoginPage(),
              SizedBox(height: height*.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  TextButton(onPressed: (){}, child: const Text("Login")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
