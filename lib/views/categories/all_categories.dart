import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymcal/controllers/Exercises/exercises_cubit.dart';
import 'package:gymcal/views/home/home_page.dart';
import 'package:gymcal/views/myexercise/components/shimmer.dart';

class AllCategories extends StatefulWidget {
  AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  final _formKey = GlobalKey<FormState>();
  int sets = 0;
  int weight = 0;
  int reps = 0;

  @override
  Widget build(BuildContext context) {
    ExercisesCubit.get(context).getExercises();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * .03,
          left: MediaQuery.sizeOf(context).width * .01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff92A3FD),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<ExercisesCubit, ExercisesState>(
                builder: (context, state) {
                  if (state is WaitingState) {
                    return buildShimmerPlaceholder();
                  } else if (state is SuccessState) {
                    return ListView.builder(
                      itemCount: ExercisesCubit.exercises.length,
                      itemBuilder: (context, index) {
                        var exercise = ExercisesCubit.exercises[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    exercise['url'] ?? '',
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          exercise['name'] ?? 'No Name',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff92A3FD),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          child: AlertDialog(
                                            backgroundColor: Colors.grey[200],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            title: Text(
                                              exercise['name'] ?? 'No Name',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            content: Form(
                                              key: _formKey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      exercise['url'] ?? '',
                                                      fit: BoxFit.cover,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'Sets',
                                                      labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter sets';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      sets =
                                                          int.tryParse(value) ??
                                                              0;
                                                    },
                                                  ),
                                                  const SizedBox(height: 8),
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'Weight',
                                                      labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter weight';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      weight =
                                                          int.tryParse(value) ??
                                                              0;
                                                    },
                                                  ),
                                                  const SizedBox(height: 8),
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'Reps',
                                                      labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter reps';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      reps =
                                                          int.tryParse(value) ??
                                                              0;
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: Color(0xff92A3FD),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  if (_formKey.currentState
                                                          ?.validate() ??
                                                      false) {
                                                    // Get the current user
                                                    User? user = FirebaseAuth.instance.currentUser;
                                                    if (user != null) {
                                                      // Use the user's UID to save to their specific collection
                                                      await FirebaseFirestore.instance
                                                          .collection('users')
                                                          .doc(user.uid)
                                                          .collection('myexercises')
                                                          .add({
                                                        'name':
                                                            exercise['name'] ?? '',
                                                        'url': exercise['url'] ?? '',
                                                        'sets': sets,
                                                        'weight': weight,
                                                        'reps': reps,
                                                        'timestamp': FieldValue.serverTimestamp(),
                                                      });
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const HomePage()));
                                                    } else {
                                                      // Handle user not logged in
                                                      ScaffoldMessenger.of(context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text('User not logged in'),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                },
                                                child: const Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      color: Color(0xff92A3FD),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Color(0xff92A3FD),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is ErrorState) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else {
                    return const Center(child: Text('No data available.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
