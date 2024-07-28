import 'package:flutter/material.dart';

class RegisterButtonLoginPage extends StatelessWidget {
  const RegisterButtonLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFF92A3FD))),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: height * .02, bottom: height * .02),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )))
                ],
              );
  }
}