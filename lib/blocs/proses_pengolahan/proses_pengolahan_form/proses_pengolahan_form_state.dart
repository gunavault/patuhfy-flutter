part of 'proses_pengolahan_form_cubit.dart';

@immutable
abstract class ProsesPengolahanFormState {}

class InitialProsesPengolahanFormState extends ProsesPengolahanFormState {}

class LoadingProsesPengolahanFormState extends ProsesPengolahanFormState {}

class SuccessProsesPengolahanFormState extends ProsesPengolahanFormState {
  final int status_code;
  final String message;
  SuccessProsesPengolahanFormState(
      {required this.status_code, required this.message});
}

class DuplicatedProsesPengolahanFormState extends ProsesPengolahanFormState {
  final int status_code;
  final String message;
  DuplicatedProsesPengolahanFormState(
      {required this.status_code, required this.message});
}

class ErrorProsesPengolahanFormState extends ProsesPengolahanFormState {
  final String? message;

  ErrorProsesPengolahanFormState(this.message);
}

class NoConnectionProsesPengolahanFormState extends ProsesPengolahanFormState {
  NoConnectionProsesPengolahanFormState();
}
