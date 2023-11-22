part of 'cek_rutin_sortasi_form_cubit.dart';

@immutable
abstract class CekRutinSortasiFormState {}

class InitialCekRutinSortasiFormState extends CekRutinSortasiFormState {}

class LoadingCekRutinSortasiFormState extends CekRutinSortasiFormState {}

class SuccessCekRutinSortasiFormState extends CekRutinSortasiFormState {
  final int status_code;
  final String message;
  SuccessCekRutinSortasiFormState(
      {required this.status_code, required this.message});
}

class DuplicatedCekRutinSortasiFormState extends CekRutinSortasiFormState {
  final int status_code;
  final String message;
  DuplicatedCekRutinSortasiFormState(
      {required this.status_code, required this.message});
}

class ErrorCekRutinSortasiFormState extends CekRutinSortasiFormState {
  final String? message;

  ErrorCekRutinSortasiFormState(this.message);
}

class NoConnectionCekRutinSortasiFormState extends CekRutinSortasiFormState {
  NoConnectionCekRutinSortasiFormState();
}
