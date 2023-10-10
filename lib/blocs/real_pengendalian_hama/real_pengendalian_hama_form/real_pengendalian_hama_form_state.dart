part of 'real_pengendalian_hama_form_cubit.dart';

@immutable
abstract class RealPengendalianHamaFormState {}

class InitialRealPengendalianHamaFormState extends RealPengendalianHamaFormState {}

class LoadingRealPengendalianHamaFormState extends RealPengendalianHamaFormState {}

class SuccessRealPengendalianHamaFormState extends RealPengendalianHamaFormState {
  final int status_code;
  final String message;
  SuccessRealPengendalianHamaFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRealPengendalianHamaFormState extends RealPengendalianHamaFormState {
  final int status_code;
  final String message;
  DuplicatedRealPengendalianHamaFormState(
      {required this.status_code, required this.message});
}

class ErrorRealPengendalianHamaFormState extends RealPengendalianHamaFormState {
  final String? message;

  ErrorRealPengendalianHamaFormState(this.message);
}
