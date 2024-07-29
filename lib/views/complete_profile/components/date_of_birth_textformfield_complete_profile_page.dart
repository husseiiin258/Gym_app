import 'package:flutter/material.dart';

class DateOfBirthTextformfieldCompleteProfilePage extends StatelessWidget {
  const DateOfBirthTextformfieldCompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.calendar_month_outlined),
                              hintText: "Date of Birth"),
                        ),
                      ),
                    );
  }
}