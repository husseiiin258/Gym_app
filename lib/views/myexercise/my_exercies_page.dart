import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymcal/controllers/MyExercises/my_exercises_cubit.dart';
import 'package:gymcal/views/exercises/all_exercises.dart';
import 'package:gymcal/views/myexercise/components/shimmer.dart';

class MyExercisesPage extends StatelessWidget {
  const MyExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyExercisesCubit.get(context).getMyExercises();
    return Scaffold(
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
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .02),
        child: BlocBuilder<MyExercisesCubit, MyExercisesState>(
          builder: (context, state) {
            if (state is WaitingStatee) {
              return buildShimmerPlaceholder();
            } else if (state is SuccessStatee) {
              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('myexercises')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No exercises found.'));
                  }

                  final documents = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      var doc = documents[index];
                      var myexercises = doc.data() as Map<String, dynamic>;
                      var documentId = doc.id;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              myexercises['url'] ?? '',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.089,
                            ),
                          ),
                          title: Text(
                            myexercises['name'] ?? 'No Name',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff92A3FD),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Sets: ${myexercises['sets'].toString()}",
                                  style: const TextStyle(
                                    color: Color(0xff92A3FD),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.05,
                                ),
                                Text(
                                  "Weight: ${myexercises['weight'].toString()}",
                                  style: const TextStyle(
                                    color: Color(0xff92A3FD),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.05,
                                ),
                                Text(
                                  "Reps: ${myexercises['reps'].toString()}",
                                  style: const TextStyle(
                                    color: Color(0xff92A3FD),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color(0xff92A3FD),
                                ),
                                onPressed: () {
                                  _showDeleteDialog(context, documentId);
                                },
                              ),
                            ],
                          ),
                          contentPadding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          selectedTileColor: Colors.grey[100],
                          selected: false,
                          onTap: () {
                            _showEditDialog(context, documentId);
                          },
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is ErrorStatee) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String documentId) {
    final TextEditingController setsController = TextEditingController();
    final TextEditingController weightController = TextEditingController();
    final TextEditingController repsController = TextEditingController();

    // Fetch existing values and populate controllers
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('myexercises')
        .doc(documentId)
        .get()
        .then((doc) {
      if (doc.exists) {
        setsController.text = doc['sets']?.toString() ?? '';
        weightController.text = doc['weight']?.toString() ?? '';
        repsController.text = doc['reps']?.toString() ?? '';
      }
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Edit Exercise',
          style: TextStyle(
            color: Color(0xff92A3FD),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField('Sets', setsController),
            const SizedBox(height: 10),
            _buildTextField('Weight', weightController),
            const SizedBox(height: 10),
            _buildTextField('Reps', repsController),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              final newSets = setsController.text;
              final newWeight = weightController.text;
              final newReps = repsController.text;

              if (newSets.isNotEmpty &&
                  newWeight.isNotEmpty &&
                  newReps.isNotEmpty) {
                _updateExercise(documentId, newSets, newWeight, newReps);
              }
              Navigator.of(context).pop();
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Color(0xff92A3FD)),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String documentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Delete Exercise',
          style: TextStyle(
            color: Color(0xff92A3FD),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you sure you want to delete this exercise?',
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              _deleteExercise(documentId);
              Navigator.of(context).pop();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Color(0xff92A3FD)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xff92A3FD)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff92A3FD)),
        ),
      ),
    );
  }

  Future<void> _updateExercise(
    String documentId,
    String sets,
    String weight,
    String reps,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('myexercises')
        .doc(documentId)
        .update({
      'sets': int.parse(sets),
      'weight': double.parse(weight),
      'reps': int.parse(reps),
    });
  }

  Future<void> _deleteExercise(String documentId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('myexercises')
        .doc(documentId)
        .delete();
  }
}
