import 'package:flutter/material.dart';

class PasswordTextformfieldCreateAccountPage extends StatelessWidget {
  const PasswordTextformfieldCreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: EdgeInsets.only(left: width * .01),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_outline),
                        labelText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye_outlined)),
                  ),
                ),
              );
  }
}