import 'package:flutter/material.dart';
import 'package:gym_app/views/Login/login_page.dart';
import 'package:gym_app/views/complete_profile/complete_profile_page.dart';

class NextBuutonCompleteProfilePage extends StatelessWidget {
  NextBuutonCompleteProfilePage({super.key});
  CompleteProfilePageState completeProfilePage = CompleteProfilePageState();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff92A3FD))),
                onPressed: () {
                  completeProfilePage.signUp();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: height * .02, bottom: height * .02),
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
