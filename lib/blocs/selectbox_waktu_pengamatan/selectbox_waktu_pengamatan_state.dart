part of 'selectbox_waktu_pengamatan_cubit.dart';

@immutable
abstract class SelectboxWaktuPengamatanState {}

class InitialState extends SelectboxWaktuPengamatanState {}

class LoadingState extends SelectboxWaktuPengamatanState {}

class SuccessState extends SelectboxWaktuPengamatanState {
  final List<WaktuPengamatanModel> listWaktuPengamatan;
  SuccessState(this.listWaktuPengamatan);
}

class ErrorState extends SelectboxWaktuPengamatanState {}
