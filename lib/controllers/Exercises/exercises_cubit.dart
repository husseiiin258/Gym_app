import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'exercises_state.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  ExercisesCubit() : super(ExercisesInitial());
  
  static ExercisesCubit get(context) => BlocProvider.of(context);
  
  static List<Map<String, dynamic>> exercises = [];
  
  Future<void> getExercises() async {
    emit(WaitingState());
    
    try {
      var res = await FirebaseFirestore.instance.collection('exercises').get();
      
      exercises = res.docs.map((doc) => doc.data()).toList();
      
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
