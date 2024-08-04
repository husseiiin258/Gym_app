// import 'package:flutter/material.dart';
// import 'package:gym_app/services/auth/auth_service.dart';
// import 'package:gym_app/views/Login/components/email_textformfield_login_page.dart';
// import 'package:gym_app/views/Login/components/login_button_login_page.dart';
// import 'package:gym_app/views/Login/components/password_textformfeild_login_page.dart';
// import 'package:gym_app/views/complete_profile/complete_profile_page.dart';

// class LoginPage extends StatelessWidget {
//    LoginPage({super.key});
//   AuthService _authService = AuthService();

//   void _signIn() async {
//     final user = await _authService.signInWithEmailPassword(
//       EmailTextformfieldLoginPage.emailController.text,
//       PasswordTextformfieldLoginPage.passwordController.text,
//     );
//     if (user != null) {
//       // Navigate to another page or show a success message
//       print('Sign in successful: ${user.email}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     double width = MediaQuery.sizeOf(context).width;
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.only(
//               top: height * .04, left: width * .08, right: width * .08),
//           child: Column(
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Hey there,",
//                     style: TextStyle(fontSize: 16),
//                   )
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "welcome Back",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: height * .02,
//               ),
//                EmailTextformfieldLoginPage(),
//               SizedBox(
//                 height: height * .02,
//               ),
//                PasswordTextformfieldLoginPage(),
//               SizedBox(
//                 height: height * .4,
//               ),
//               const LoginButtonLoginPage(),
//               SizedBox(
//                 height: height * .01,
//               ),
//               const Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1.0,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       "Or",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1.0,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: height * .04,
//               ),
//               // const SocialMediaButtonsCreateAccountPage(),
//               SizedBox(
//                 height: height * .03,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don't have an account?",
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                   ),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CompleteProfilePage()));
//                       },
//                       child: const Text("Register")),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gym_app/views/Login/components/email_textformfield_login_page.dart';
import 'package:gym_app/views/Login/components/login_button_login_page.dart';
import 'package:gym_app/views/Login/components/password_textformfeild_login_page.dart';
import 'package:gym_app/views/complete_profile/complete_profile_page.dart';
import 'package:gym_app/views/home/home_page.dart';
// Adjust import path as necessary

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff92A3FD),
            title: const Text("Login Page")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                PasswordTextformfeildLoginPage(
                    passwordController: _passwordController),
                SizedBox(height: height * 0.02),
                EmailTextformfieldLoginPage(emailController: _emailController),
                SizedBox(height: height * 0.2),
                LoginButtonLoginPage(formKey: _formKey),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don' have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompleteProfilePage()));
                        },
                        child: const Text("Register"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
