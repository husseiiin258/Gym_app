
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/views/profile/components/listtile_yourheight_profile_page.dart';
import 'package:gym_app/views/profile/components/listtile_yourweight_profile_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? userName;

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          userName = userDoc['name'];
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/Frame.png",
                  width: width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: height * .02),
            Text(
              "Welcome, ${userName ?? '...'}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * .1, right: width * .1, top: width * .04),
              child: Column(
                children: [
                  const ListtileYourweightProfilePage(),
                  SizedBox(
                    height: height * .02,
                  ),
                  const ListtileYourheightProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
