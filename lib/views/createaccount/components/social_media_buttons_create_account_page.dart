import 'package:flutter/material.dart';

class SocialMediaButtonsCreateAccountPage extends StatelessWidget {
  const SocialMediaButtonsCreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Image.asset("assets/images/google.png",width: width*.1,)),
                  SizedBox(width: width*.1,),
                  IconButton(onPressed: (){}, icon: Image.asset("assets/images/facebook.png",width: width*.1,)),
                ],
              );
  }
}