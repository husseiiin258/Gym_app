import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymcal/views/Login/login_page.dart';
import 'package:gymcal/views/googleCompleteProfile/components/height_textformfield_google.dart';
import 'package:gymcal/views/googleCompleteProfile/components/weight_textformfield_google.dart';

class GoogleCompleteProfilePage extends StatefulWidget {
  const GoogleCompleteProfilePage({super.key});

  @override
  _GoogleCompleteProfilePageState createState() =>
      _GoogleCompleteProfilePageState();
}

class _GoogleCompleteProfilePageState extends State<GoogleCompleteProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .03),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/completeprofile.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let’s complete your profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It will help us to know more about you!",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              WeightTextformfieldGoogle(),
              SizedBox(height: height * .02),
              HeightTextformfieldGoogle(),
              SizedBox(height: height * .02),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff92A3FD)),
                      ),
                      onPressed: _saveProfile,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: height * .02, bottom: height * .02),
                        child: const Text(
                          "Next >",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
            'weight': WeightTextformfieldGoogle.weightController.text,
            'height': HeightTextformfieldGoogle.heightController.text,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully')),
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginPage())); // Go back to previous page
        }
      } catch (e) {
        print('Error updating profile: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error updating profile')),
        );
      }
    }
  }
}
