// import 'package:flutter/material.dart';

// class PasswordTextformfieldLoginPage extends StatelessWidget {
//   PasswordTextformfieldLoginPage({super.key});
//   static final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.grey[200], borderRadius: BorderRadius.circular(14)),
//       child: Padding(
//         padding: EdgeInsets.only(left: width * .01),
//         child: TextFormField(
//           controller: passwordController,
//           decoration: const InputDecoration(
//               border: InputBorder.none,
//               icon: Icon(Icons.lock_outline),
//               labelText: "Password",
//               suffixIcon: Icon(Icons.remove_red_eye_outlined)),
//         ),
//       ),
//     );
//   }
// }


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
            return null;
          },
        ),
      ),
    );
  }
}
