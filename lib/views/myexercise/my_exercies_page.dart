import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymcal/controllers/MyExercises/my_exercises_cubit.dart';
import 'package:gymcal/views/categories/all_categories.dart';
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
        padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*.02),
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
                                  myexercises['url'] ?? '',
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        myexercises['name'] ?? 'No Name',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff92A3FD),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Sets: ${myexercises['sets'].toString()}",
                                            style: const TextStyle(
                                              color: Color(0xff92A3FD),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                MediaQuery.sizeOf(context).width *
                                                    0.05,
                                          ),
                                          Text(
                                            "Weight: ${myexercises['weight'].toString()}",
                                            style: const TextStyle(
                                              color: Color(0xff92A3FD),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                MediaQuery.sizeOf(context).width *
                                                    0.05,
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
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.03,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Color(0xff92A3FD),
                                            ),
                                            onPressed: () {
                                              _showEditDialog(
                                                  context, documentId);
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Color(0xff92A3FD),
                                            ),
                                            onPressed: () {
                                              _showDeleteDialog(
                                                  context, documentId);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
        title: const Text('Edit Exercise'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: setsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter new sets',
              ),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter new weight',
              ),
            ),
            TextField(
              controller: repsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter new reps',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
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
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String documentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Exercise'),
        content: const Text('Are you sure you want to delete this exercise?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _deleteExercise(documentId);
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _updateExercise(String documentId, String newSets,
      String newWeight, String newReps) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('myexercises')
          .doc(documentId)
          .update({
        'sets': newSets,
        'weight': newWeight,
        'reps': newReps,
      });
    } catch (e) {
      print('Error updating exercise: $e');
      // Consider adding user feedback here
    }
  }

  Future<void> _deleteExercise(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('myexercises')
          .doc(documentId)
          .delete();
    } catch (e) {
      print('Error deleting exercise: $e');
      // Consider adding user feedback here
    }
  }
}
