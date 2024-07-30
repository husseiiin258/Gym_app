import 'package:flutter/material.dart';
import 'package:gym_app/views/profile/components/listtile_yourheight_profile_page.dart';
import 'package:gym_app/views/profile/components/listtile_yourweight_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/Frame.png",
                  width: width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: height * .02),
            const Text(
              "Welcome,....",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Text(
              "Email,....",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
              Padding(
                padding:  EdgeInsets.only(left: width*.1,right: width*.1,top: width*.04),
                child: Column(
                  children: [
                    const ListtileYourweightProfilePage(),
                    SizedBox(height: height*.02,),
                    const ListtileYourheightProfilePage(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
