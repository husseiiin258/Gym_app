import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymcal/controllers/Exercises/exercises_cubit.dart';
import 'package:gymcal/controllers/MyExercises/my_exercises_cubit.dart';
import 'package:gymcal/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    {
      return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ExercisesCubit()),
             BlocProvider(create: (context) => MyExercisesCubit()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ));
    }
  }
}
