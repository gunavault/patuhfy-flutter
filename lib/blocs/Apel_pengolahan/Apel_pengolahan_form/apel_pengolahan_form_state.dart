part of 'apel_pengolahan_form_cubit.dart';

@immutable
abstract class ApelPengolahanFormState {}

class InitialApelPengolahanFormState extends ApelPengolahanFormState {}

class LoadingApelPengolahanFormState extends ApelPengolahanFormState {}

class SuccessApelPengolahanFormState extends ApelPengolahanFormState {
  final int status_code;
  final String message;
  SuccessApelPengolahanFormState(
      {required this.status_code, required this.message});
}

class DuplicatedApelPengolahanFormState extends ApelPengolahanFormState {
  final int status_code;
  final String message;
  DuplicatedApelPengolahanFormState(
      {required this.status_code, required this.message});
}

class ErrorApelPengolahanFormState extends ApelPengolahanFormState {
  final String? message;

  ErrorApelPengolahanFormState(this.message);
}

class NoConnectionApelPengolahanFormState extends ApelPengolahanFormState {
  NoConnectionApelPengolahanFormState();
}
