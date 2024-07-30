import 'package:flutter/material.dart';
import 'package:gym_app/views/categories/all_categories.dart';
import 'package:gym_app/views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllCategories(),
    );
  }
}
