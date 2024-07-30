import 'package:flutter/material.dart';

class ListtileYourheightProfilePage extends StatelessWidget {
  const ListtileYourheightProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      title: const Text(
                        "Your Height",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      leading: const Icon(
                        Icons.height,
                        color:  Color(0xff92A3FD)
                      ),
                      trailing:IconButton(icon: const Icon(Icons.edit,color:Color(0xff92A3FD),),onPressed: (){},)
                    );
  }
}