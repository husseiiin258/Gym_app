import 'package:flutter/material.dart';
import 'package:gym_app/views/complete_profile/complete_profile_page.dart';

class FirtsnameTextformfiledCompleteProfile extends StatelessWidget {
   FirtsnameTextformfiledCompleteProfile({super.key});
    static final TextEditingController nameController = TextEditingController();
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
                          controller: nameController,
                          key: completeProfilePageState.formKey,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.person_2_outlined),
                              hintText: "First Name"),
                        ),
                      ),
                    );
  }
}