part of 'real_penunasan_form_cubit.dart';

@immutable
abstract class RealPenunasanFormState {}

class InitialRealPenunasanFormState extends RealPenunasanFormState {}

class LoadingRealPenunasanFormState extends RealPenunasanFormState {}

class SuccessRealPenunasanFormState extends RealPenunasanFormState {
  final int status_code;
  final String message;
  SuccessRealPenunasanFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRealPenunasanFormState extends RealPenunasanFormState {
  final int status_code;
  final String message;
  DuplicatedRealPenunasanFormState(
      {required this.status_code, required this.message});
}

class ErrorRealPenunasanFormState extends RealPenunasanFormState {
  final String? message;

  ErrorRealPenunasanFormState(this.message);
}
