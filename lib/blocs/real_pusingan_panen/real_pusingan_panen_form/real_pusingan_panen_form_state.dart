part of 'real_pusingan_panen_form_cubit.dart';

@immutable
abstract class RealPusinganPanenFormState {}

class InitialRealPusinganPanenFormState extends RealPusinganPanenFormState {}

class LoadingRealPusinganPanenFormState extends RealPusinganPanenFormState {}

class SuccessRealPusinganPanenFormState extends RealPusinganPanenFormState {
  final int status_code;
  final String message;
  SuccessRealPusinganPanenFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRealPusinganPanenFormState extends RealPusinganPanenFormState {
  final int status_code;
  final String message;
  DuplicatedRealPusinganPanenFormState(
      {required this.status_code, required this.message});
}

class ErrorRealPusinganPanenFormState extends RealPusinganPanenFormState {
  final String? message;

  ErrorRealPusinganPanenFormState(this.message);
}
