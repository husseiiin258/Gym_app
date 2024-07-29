import 'package:flutter/material.dart';

class ChooseGenderTextformfieldCompleteProfilePage extends StatelessWidget {
  const ChooseGenderTextformfieldCompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
      TextEditingController textEditingController = TextEditingController();

    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.people_alt_outlined),
                              hintText: "Choose Gender"),
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(
                                  children: <Widget>[
                                    ListTile(
                                      title: const Text('Male'),
                                      onTap: () {
                                        textEditingController.text = "Male";
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: const Text('Female'),
                                      onTap: () {
                                        textEditingController.text = "Female";
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
  }
}