import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/controllers/Exercises/exercises_cubit.dart';
import 'package:gym_app/views/allexercies/all_exercies_page.dart';
import 'package:gym_app/views/categories/all_categories.dart';

class MyExerciesPage extends StatelessWidget {
  const MyExerciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AllCategories()),
            );
          },
          backgroundColor: const Color(0xff92A3FD),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}
