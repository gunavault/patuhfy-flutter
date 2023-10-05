part of 'real_pemupukan_form_cubit.dart';

@immutable
abstract class RealPemupukanFormState {}

class InitialRealPemupukanFormState extends RealPemupukanFormState {}

class LoadingRealPemupukanFormState extends RealPemupukanFormState {}

class SuccessRealPemupukanFormState extends RealPemupukanFormState {
  final int status_code;
  final String message;
  SuccessRealPemupukanFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRealPemupukanFormState extends RealPemupukanFormState {
  final int status_code;
  final String message;
  DuplicatedRealPemupukanFormState(
      {required this.status_code, required this.message});
}

class ErrorRealPemupukanFormState extends RealPemupukanFormState {
  final String? message;

  ErrorRealPemupukanFormState(this.message);
}
