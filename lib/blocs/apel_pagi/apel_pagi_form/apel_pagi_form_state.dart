part of 'apel_pagi_form_cubit.dart';

@immutable
abstract class ApelPagiFormState {}

class InitialApelPagiFormState extends ApelPagiFormState {}

class LoadingApelPagiFormState extends ApelPagiFormState {}

class SuccessApelPagiFormState extends ApelPagiFormState {
  final int status_code;
  final String message;
  SuccessApelPagiFormState({required this.status_code, required this.message});
}

class DuplicatedApelPagiFormState extends ApelPagiFormState {
  final int status_code;
  final String message;
  DuplicatedApelPagiFormState(
      {required this.status_code, required this.message});
}

class ErrorApelPagiFormState extends ApelPagiFormState {
  final String? message;

  ErrorApelPagiFormState(this.message);
}
