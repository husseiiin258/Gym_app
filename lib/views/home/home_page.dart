import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/views/myexercise/my_exercies_page.dart';
import 'package:gym_app/views/profile/profile_page.dart';
 // Import your actual home screen here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  final List<Widget> designsScreens = [
    const MyExerciesPage(), 
     ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: designsScreens.elementAt(currentindex),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xff92A3FD),
          animationDuration: const Duration(milliseconds: 300),
          index: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.home,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
