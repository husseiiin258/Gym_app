part of 'my_exercises_cubit.dart';


sealed class MyExercisesState {}

final class MyExercisesInitial extends MyExercisesState {}
class WaitingStatee extends MyExercisesState{}
class SuccessStatee extends MyExercisesState{}
class ErrorStatee extends MyExercisesState{
  final String error;

  ErrorStatee(this.error);
}
