part of 'real_restan_form_cubit.dart';

@immutable
abstract class RealRestanFormState {}

class InitialRealRestanFormState extends RealRestanFormState {}

class LoadingRealRestanFormState extends RealRestanFormState {}

class SuccessRealRestanFormState extends RealRestanFormState {
  final int status_code;
  final String message;
  SuccessRealRestanFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRealRestanFormState extends RealRestanFormState {
  final int status_code;
  final String message;
  DuplicatedRealRestanFormState(
      {required this.status_code, required this.message});
}

class ErrorRealRestanFormState extends RealRestanFormState {
  final String? message;

  ErrorRealRestanFormState(this.message);
}
