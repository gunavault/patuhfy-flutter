part of 'apel_pagi_form_cubit.dart';

@immutable
abstract class ApelPagiFormState {}

class InitialApelPagiFormState extends ApelPagiFormState {}

class LoadingApelPagiFormState extends ApelPagiFormState {}

class SuccessApelPagiFormState extends ApelPagiFormState {
  final String? message;
  SuccessApelPagiFormState(this.message);
}

class ErrorApelPagiFormState extends ApelPagiFormState {
  final String? message;

  ErrorApelPagiFormState(this.message);
}
