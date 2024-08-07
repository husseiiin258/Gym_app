import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/controllers/Exercises/exercises_cubit.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    ExercisesCubit.get(context).getExercises();
    return Scaffold(

      body: BlocBuilder<ExercisesCubit, ExercisesState>(
        builder: (context, state) {
          if (state is WaitingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessState) {
            return ListView.builder(
              itemCount: ExercisesCubit.exercises.length,
              itemBuilder: (context, index) {
                var exercise = ExercisesCubit.exercises[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
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
                            width: MediaQuery.of(context).size.width * 0.3,
                            // height: 100.0, // Adjust the height as needed
                          ),
                        ),
                        // SizedBox(width: 16.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise['name'] ?? 'No Name',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // SizedBox(height: 4.0),
                                // Add more details or description if needed
                              ],
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.add))
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
