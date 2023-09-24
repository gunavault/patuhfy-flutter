part of 'inspeksi_tph_form_cubit.dart';

@immutable
abstract class InspeksiTphFormState {}

class InitialInspeksiTphFormState extends InspeksiTphFormState {}

class LoadingInspeksiTphFormState extends InspeksiTphFormState {}

class SuccessInspeksiTphFormState extends InspeksiTphFormState {
  final int status_code;
  final String message;
  SuccessInspeksiTphFormState(
      {required this.status_code, required this.message});
}

class DuplicatedInspeksiTphFormState extends InspeksiTphFormState {
  final int status_code;
  final String message;
  DuplicatedInspeksiTphFormState(
      {required this.status_code, required this.message});
}

class ErrorInspeksiTphFormState extends InspeksiTphFormState {
  final String? message;

  ErrorInspeksiTphFormState(this.message);
}
