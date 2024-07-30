import 'package:flutter/material.dart';

import 'package:gym_app/views/arm/arm_exercises.dart';
import 'package:gym_app/views/back/back_exercises.dart';
import 'package:gym_app/views/chest/chest_exercises.dart';
import 'package:gym_app/views/leg/leg_exercises.dart';
import 'package:gym_app/views/shoulder/shoulder_exercises.dart';

import 'category_model.dart';

class CategoryDetailsView extends StatelessWidget {
  String catId;

  final CategoryModel categoryModel;
  CategoryDetailsView({required this.categoryModel, required this.catId});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: catId == "arm"
            ? const ArmExercises()
            : catId == "shoulder"
                ? const ShoulderExercises()
                : catId == "leg"
                    ? const LegExercises()
                    : catId == "chest"
                        ? const ChestExercises()
                        : const BackExercises(),
      ),
    );
  }
}
