import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xff92A3FD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
        title: const Text(
          'All Categories',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          elevation: 2,
                          child: ListTile(
                              contentPadding: const EdgeInsets.all(12.0),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  exercise['url'],
                                  fit: BoxFit.cover,
                                  width: MediaQuery.sizeOf(context).width * .09,
                                  // height: 60,
                                ),
                              ),
                              title: Text(
                                exercise['name'],
                                style: const TextStyle(
                                  color: Color(0xff92A3FD),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(exercise['name']),
                              trailing: const Icon(
                                Icons.chevron_right,
                                color: Color(0xff92A3FD),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.network(
                                                  exercise['url'] ?? '',
                                                  fit: BoxFit.cover,
                                                  // height: 200,
                                                  width: double.infinity,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Center(
                                                child: Text(
                                                  exercise['name'] ?? 'No Name',
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff92A3FD),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Sets',
                                                        labelStyle:
                                                            const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff92A3FD),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color(
                                                                      0xff92A3FD)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color(
                                                                      0xff92A3FD),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
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
                                                        sets = int.tryParse(
                                                                value) ??
                                                            0;
                                                      },
                                                    ),
                                                    const SizedBox(height: 12),
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Weight',
                                                        labelStyle:
                                                            const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff92A3FD),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color(
                                                                      0xff92A3FD)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color(
                                                                      0xff92A3FD),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
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
                                                        weight = int.tryParse(
                                                                value) ??
                                                            0;
                                                      },
                                                    ),
                                                    const SizedBox(height: 12),
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Reps',
                                                        labelStyle:
                                                            const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff92A3FD),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color(
                                                                      0xff92A3FD)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color(
                                                                      0xff92A3FD),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
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
                                                        reps = int.tryParse(
                                                                value) ??
                                                            0;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff92A3FD),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xff92A3FD),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 20,
                                                          vertical: 12),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      if (_formKey.currentState
                                                              ?.validate() ??
                                                          false) {
                                                        User? user =
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser;
                                                        if (user != null) {
                                                          final userExercisesCollection =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'users')
                                                                  .doc(user.uid)
                                                                  .collection(
                                                                      'myexercises');

                                                          // Check if the exercise already exists
                                                          final querySnapshot =
                                                              await userExercisesCollection
                                                                  .where('name',
                                                                      isEqualTo:
                                                                          exercise[
                                                                              'name'])
                                                                  .get();

                                                          if (querySnapshot.docs
                                                              .isNotEmpty) {
                                                            // Exercise already exists, update the existing document
                                                            final docId =
                                                                querySnapshot
                                                                    .docs
                                                                    .first
                                                                    .id;
                                                            await userExercisesCollection
                                                                .doc(docId)
                                                                .update({
                                                              'sets': sets,
                                                              'weight': weight,
                                                              'reps': reps,
                                                              'timestamp':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            });
                                                          } else {
                                                            // Exercise does not exist, add a new document
                                                            await userExercisesCollection
                                                                .add({
                                                              'name': exercise[
                                                                      'name'] ??
                                                                  '',
                                                              'url': exercise[
                                                                      'url'] ??
                                                                  '',
                                                              'sets': sets,
                                                              'weight': weight,
                                                              'reps': reps,
                                                              'timestamp':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            });
                                                          }

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const HomePage()),
                                                          );
                                                        } else {
                                                          // Handle user not logged in
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  'User not logged in'),
                                                            ),
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: const Text(
                                                      'Save',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
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
                                  },
                                );
                              }),
                        );
                      },
                    );
                  } else if (state is ErrorState) {
                    return Center(
                      child: Text(
                        'Error: ${state.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
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
