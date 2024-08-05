


import 'package:flutter/material.dart';

class EmailTextformfieldCompleteProfile extends StatelessWidget {
  EmailTextformfieldCompleteProfile({super.key});

  static final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.email_outlined),
              hintText: "Create Email"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ),
    );
  }
}
