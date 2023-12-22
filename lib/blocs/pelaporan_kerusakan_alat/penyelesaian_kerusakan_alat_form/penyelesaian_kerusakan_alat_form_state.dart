part of 'penyelesaian_kerusakan_alat_form_cubit.dart';

@immutable
abstract class PenyelesaiankerusakanAlatFormState {}

class InitialPenyelesaiankerusakanAlatFormState extends PenyelesaiankerusakanAlatFormState {}

class LoadingPenyelesaiankerusakanAlatFormState extends PenyelesaiankerusakanAlatFormState {}

class SuccessPenyelesaiankerusakanAlatFormState extends PenyelesaiankerusakanAlatFormState {
  final int status_code;
  final String message;
  SuccessPenyelesaiankerusakanAlatFormState({required this.status_code, required this.message});
}

class DuplicatedPenyelesaiankerusakanAlatFormState extends PenyelesaiankerusakanAlatFormState {
  final int status_code;
  final String message;
  DuplicatedPenyelesaiankerusakanAlatFormState(
      {required this.status_code, required this.message});
}

class ErrorPenyelesaiankerusakanAlatFormState extends PenyelesaiankerusakanAlatFormState {
  final String? message;

  ErrorPenyelesaiankerusakanAlatFormState(this.message);
}
