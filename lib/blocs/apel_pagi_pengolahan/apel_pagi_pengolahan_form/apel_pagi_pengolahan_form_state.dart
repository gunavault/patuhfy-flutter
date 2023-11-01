part of 'apel_pagi_pengolahan_form_cubit.dart';

@immutable
abstract class ApelPagiPengolahanFormState {}

class InitialApelPagiPengolahanFormState extends ApelPagiPengolahanFormState {}

class LoadingApelPagiPengolahanFormState extends ApelPagiPengolahanFormState {}

class SuccessApelPagiPengolahanFormState extends ApelPagiPengolahanFormState {
  final int status_code;
  final String message;
  SuccessApelPagiPengolahanFormState(
      {required this.status_code, required this.message});
}

class DuplicatedApelPagiPengolahanFormState
    extends ApelPagiPengolahanFormState {
  final int status_code;
  final String message;
  DuplicatedApelPagiPengolahanFormState(
      {required this.status_code, required this.message});
}

class ErrorApelPagiPengolahanFormState extends ApelPagiPengolahanFormState {
  final String? message;

  ErrorApelPagiPengolahanFormState(this.message);
}
