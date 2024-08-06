import 'package:flutter/material.dart';
import 'package:gym_app/services/auth/auth_service.dart';
import 'package:gym_app/services/auth/google_auth.dart';
import 'package:gym_app/views/Login/components/email_textformfield_login_page.dart';
import 'package:gym_app/views/Login/components/login_button_login_page.dart';
import 'package:gym_app/views/Login/components/password_textformfeild_login_page.dart';
import 'package:gym_app/views/complete_profile/complete_profile_page.dart';
import 'package:gym_app/views/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final GoogleAuth _googleAuth = GoogleAuth();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      final user = await _authService.signInWithEmailPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        _showErrorDialog('Invalid email or password.');
      }
    }
  }

  void _signInWithGoogle() async {
    final user = await _googleAuth.signInWithGoogle();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      _showErrorDialog('Google sign-in failed.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.2, left: width * 0.04, right: width * 0.04),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  EmailTextformfieldLoginPage(
                      emailController: _emailController),
                  SizedBox(height: height * 0.02),
                  PasswordTextformfeildLoginPage(
                      passwordController: _passwordController),
                  SizedBox(height: height * 0.2),
                  LoginButtonLoginPage(onPressed: _signInWithEmailPassword),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
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
                  ),
                  SizedBox(height: height * 0.03),
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
                  IconButton(
                      onPressed: () {
                        _signInWithGoogle();
                      },
                      icon: Image.asset(
                        "assets/images/google.png",
                        width: width * .12,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

















