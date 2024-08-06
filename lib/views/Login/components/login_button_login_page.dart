import 'package:flutter/material.dart';

class LoginButtonLoginPage extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButtonLoginPage({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xff92A3FD)),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
