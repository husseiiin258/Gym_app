

import 'package:flutter/material.dart';

class FirtsnameTextformfiledCompleteProfile extends StatelessWidget {
  FirtsnameTextformfiledCompleteProfile({super.key});

  static final TextEditingController firstnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: firstnameController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.person_2_outlined),
              hintText: "First Name"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
      ),
    );
  }
}