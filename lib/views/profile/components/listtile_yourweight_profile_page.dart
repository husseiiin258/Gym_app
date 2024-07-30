import 'package:flutter/material.dart';

class ListtileYourweightProfilePage extends StatelessWidget {
  const ListtileYourweightProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      title: const Text(
                        "Your Weight",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      leading: const Icon(
                        Icons.monitor_weight_outlined,
                        color:  Color(0xff92A3FD)
                      ),
                      trailing:  IconButton(icon: const Icon(Icons.edit,color:Color(0xff92A3FD),),onPressed: (){},)
                    );
  }
}