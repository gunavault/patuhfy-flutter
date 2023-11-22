part of 'pelaporan_kerusakan_alat_form_cubit.dart';

@immutable
abstract class PelaporanKerusakanAlatFormState {}

class InitialPelaporanKerusakanAlatFormState
    extends PelaporanKerusakanAlatFormState {}

class LoadingPelaporanKerusakanAlatFormState
    extends PelaporanKerusakanAlatFormState {}

class SuccessPelaporanKerusakanAlatFormState
    extends PelaporanKerusakanAlatFormState {
  final int status_code;
  final String message;
  SuccessPelaporanKerusakanAlatFormState(
      {required this.status_code, required this.message});
}

class DuplicatedPelaporanKerusakanAlatFormState
    extends PelaporanKerusakanAlatFormState {
  final int status_code;
  final String message;
  DuplicatedPelaporanKerusakanAlatFormState(
      {required this.status_code, required this.message});
}

class ErrorPelaporanKerusakanAlatFormState
    extends PelaporanKerusakanAlatFormState {
  final String? message;

  ErrorPelaporanKerusakanAlatFormState(this.message);
}

class NoConnectionPelaporanKerusakanAlatFormState
    extends PelaporanKerusakanAlatFormState {
  NoConnectionPelaporanKerusakanAlatFormState();
}
