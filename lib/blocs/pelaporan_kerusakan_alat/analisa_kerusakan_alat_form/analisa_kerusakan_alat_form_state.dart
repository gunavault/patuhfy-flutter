part of 'analisa_kerusakan_alat_form_cubit.dart';

@immutable
abstract class AnalisakerusakanAlatFormState {}

class InitialAnalisakerusakanAlatFormState extends AnalisakerusakanAlatFormState {}

class LoadingAnalisakerusakanAlatFormState extends AnalisakerusakanAlatFormState {}

class SuccessAnalisakerusakanAlatFormState extends AnalisakerusakanAlatFormState {
  final int status_code;
  final String message;
  SuccessAnalisakerusakanAlatFormState({required this.status_code, required this.message});
}

class DuplicatedAnalisakerusakanAlatFormState extends AnalisakerusakanAlatFormState {
  final int status_code;
  final String message;
  DuplicatedAnalisakerusakanAlatFormState(
      {required this.status_code, required this.message});
}

class ErrorAnalisakerusakanAlatFormState extends AnalisakerusakanAlatFormState {
  final String? message;

  ErrorAnalisakerusakanAlatFormState(this.message);
}
