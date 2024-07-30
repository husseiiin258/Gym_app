import 'package:flutter/material.dart';
import 'package:gym_app/views/complete_profile/complete_profile_page.dart';

class RegisterButtonCreateAccountPage extends StatelessWidget {
  const RegisterButtonCreateAccountPage({super.key});

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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteProfilePage()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: height * .02, bottom: height * .02),
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
