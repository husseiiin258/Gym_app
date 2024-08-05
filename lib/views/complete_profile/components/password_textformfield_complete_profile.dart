
import 'package:flutter/material.dart';

class PasswordTextformfieldCompleteProfile extends StatelessWidget {
  PasswordTextformfieldCompleteProfile({super.key});

  static final TextEditingController passwordController = TextEditingController();

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
          decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.lock),
              hintText: "Create Password"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ),
    );
  }
}