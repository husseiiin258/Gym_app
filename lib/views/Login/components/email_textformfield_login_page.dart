// import 'package:flutter/material.dart';

// class EmailTextformfieldLoginPage extends StatelessWidget {
//   EmailTextformfieldLoginPage({super.key});
//   static final TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.grey[200], borderRadius: BorderRadius.circular(14)),
//       child: Padding(
//         padding: EdgeInsets.only(left: width * .01),
//         child: TextFormField(
//           controller: emailController,
//           decoration: const InputDecoration(
//               border: InputBorder.none,
//               icon: Icon(Icons.email_outlined),
//               labelText: "Email"),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class EmailTextformfieldLoginPage extends StatelessWidget {
  final TextEditingController emailController;
  
  EmailTextformfieldLoginPage({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.only(left: width * .01),
        child: TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.email_outlined),
              labelText: "Email"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!value.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
      ),
    );
  }
}
