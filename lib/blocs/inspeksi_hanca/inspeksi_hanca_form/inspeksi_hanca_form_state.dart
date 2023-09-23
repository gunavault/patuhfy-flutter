part of 'inspeksi_hanca_form_cubit.dart';

@immutable
abstract class InspeksiHancaFormState {}

class InitialInspeksiHancaFormState extends InspeksiHancaFormState {}

class LoadingInspeksiHancaFormState extends InspeksiHancaFormState {}

class SuccessInspeksiHancaFormState extends InspeksiHancaFormState {
  final int status_code;
  final String message;
  SuccessInspeksiHancaFormState(
      {required this.status_code, required this.message});
}

class DuplicatedInspeksiHancaFormState extends InspeksiHancaFormState {
  final int status_code;
  final String message;
  DuplicatedInspeksiHancaFormState(
      {required this.status_code, required this.message});
}

class ErrorInspeksiHancaFormState extends InspeksiHancaFormState {
  final String? message;

  ErrorInspeksiHancaFormState(this.message);
}
