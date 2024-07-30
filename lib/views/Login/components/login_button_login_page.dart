import 'package:flutter/material.dart';
import 'package:gym_app/views/home/home_page.dart';

class LoginButtonLoginPage extends StatelessWidget {
  const LoginButtonLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff92A3FD))),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: height * .02, bottom: height * .02),
                  child: const Text(
                    "Login",
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
