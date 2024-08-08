import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_exercises_state.dart';

class MyExercisesCubit extends Cubit<MyExercisesState> {
  MyExercisesCubit() : super(MyExercisesInitial());

  static MyExercisesCubit get(context) => BlocProvider.of(context);

  static List<Map<String, dynamic>> myexercises = [];

  Future<void> getMyExercises() async {
    emit(WaitingStatee());
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('myexercises')
            .orderBy('timestamp', descending: true)
            .get();

        myexercises = snapshot.docs.map((doc) => doc.data()).toList();
        emit(SuccessStatee());
      } else {
        emit(ErrorStatee('User not logged in'));
      }
    } catch (e) {
      emit(ErrorStatee(e.toString()));
    }
  }
}
