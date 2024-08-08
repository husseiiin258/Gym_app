import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymcal/views/Login/login_page.dart';
import 'package:gymcal/views/profile/components/listtile_yourheight_profile_page.dart';
import 'package:gymcal/views/profile/components/listtile_yourweight_profile_page.dart';

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
          final data = userDoc.data() as Map<String, dynamic>?;

          if (data != null) {
            userName = data['name'] ?? data['displayName'] ?? 'User';
          }
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                SizedBox(height: height*.02,),
                Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xff92A3FD)),
            ),
            onPressed: logout,
            child: Padding(
              padding: EdgeInsets.only(top: height * .02, bottom: height * .02),
              child: const Text(
                "Log Out >",
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
        ],
      ),
    );
  }
}
