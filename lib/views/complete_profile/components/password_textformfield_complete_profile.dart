import 'package:flutter/material.dart';
import 'package:gym_app/views/complete_profile/complete_profile_page.dart';

class PasswordTextformfieldCompleteProfile extends StatelessWidget {
   PasswordTextformfieldCompleteProfile({super.key});
 static final TextEditingController passwordController = TextEditingController();
 CompleteProfilePageState completeProfilePageState=CompleteProfilePageState();

  @override
  Widget build(BuildContext context) {
      

    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passwordController,
                          key: completeProfilePageState.formKey,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.lock),
                              hintText: "Create Password"),
                        ),
                      ),
                    );
  }
}