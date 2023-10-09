part of 'real_penyiangan_form_cubit.dart';

@immutable
abstract class RealPenyianganFormState {}

class InitialRealPenyianganFormState extends RealPenyianganFormState {}

class LoadingRealPenyianganFormState extends RealPenyianganFormState {}

class SuccessRealPenyianganFormState extends RealPenyianganFormState {
  final int status_code;
  final String message;
  SuccessRealPenyianganFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRealPenyianganFormState extends RealPenyianganFormState {
  final int status_code;
  final String message;
  DuplicatedRealPenyianganFormState(
      {required this.status_code, required this.message});
}

class ErrorRealPenyianganFormState extends RealPenyianganFormState {
  final String? message;

  ErrorRealPenyianganFormState(this.message);
}
