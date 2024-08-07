part of 'exercises_cubit.dart';

@immutable
sealed class ExercisesState {}

final class ExercisesInitial extends ExercisesState {}
class WaitingState extends ExercisesState{}
class SuccessState extends ExercisesState{}
class ErrorState extends ExercisesState{
  final String error;

  ErrorState(this.error);
}
