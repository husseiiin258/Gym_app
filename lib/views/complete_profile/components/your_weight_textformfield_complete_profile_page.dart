import 'package:flutter/material.dart';

class YourWeightTextformfieldCompleteProfilePage extends StatelessWidget {
  const YourWeightTextformfieldCompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.monitor_weight_outlined),
                                  hintText: "Your weight",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * .02),
                        Container(
                          width: width * .16,
                          height: height * .06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xffC58BF2),
                          ),
                          child: const Center(
                              child: Text(
                            "KG",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    );
  }
}