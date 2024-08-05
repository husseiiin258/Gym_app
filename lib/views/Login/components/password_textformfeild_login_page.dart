
import 'package:flutter/material.dart';

class PasswordTextformfeildLoginPage extends StatelessWidget {
  final TextEditingController passwordController;
  
  PasswordTextformfeildLoginPage({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.only(left: width * .01),
        child: TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.lock),
              labelText: "Password"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else{
              return null;
            }
          },
        ),
      ),
    );
  }
}
