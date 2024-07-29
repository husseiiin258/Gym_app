import 'package:flutter/material.dart';
import 'package:gym_app/views/Login/login_page.dart';

class NextBuutonCompleteProfilePage extends StatelessWidget {
  const NextBuutonCompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff92A3FD))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginPage()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: height * .02, bottom: height * .02),
                                  child: const Text(
                                    "Next >",
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