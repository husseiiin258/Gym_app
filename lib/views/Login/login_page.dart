import 'package:flutter/material.dart';
import 'package:gym_app/views/Login/components/email_textformfield_login_page.dart';
import 'package:gym_app/views/Login/components/login_button_login_page.dart';
import 'package:gym_app/views/Login/components/password_textformfeild_login_page.dart';
import 'package:gym_app/views/complete_profile/complete_profile_page.dart';
import 'package:gym_app/views/createaccount/components/email_textFormField_create_account_page.dart';
import 'package:gym_app/views/createaccount/components/first_name_textFormField_create_account_page.dart';
import 'package:gym_app/views/createaccount/components/last_name_textFormField_create_account_page.dart';
import 'package:gym_app/views/createaccount/components/password_textFormField_create_account_page.dart';
import 'package:gym_app/views/createaccount/components/register_button_create_account_page.dart';
import 'package:gym_app/views/createaccount/components/social_media_buttons_create_account_page.dart';

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
                    "welcome Back",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              const EmailTextformfieldLoginPage(),
              SizedBox(
                height: height * .02,
              ),
              const PasswordTextformfieldLoginPage(),
              SizedBox(
                height: height * .4,
              ),
              const LoginButtonLoginPage(),
              SizedBox(
                height: height * .01,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              const SocialMediaButtonsCreateAccountPage(),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     CompleteProfilePage()));
                      },
                      child: const Text("Register")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
