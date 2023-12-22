part of 'selectbox_jenis_kerusakan_cubit.dart';

@immutable
abstract class SelectboxJenisKerusakanState {}

class InitialState extends SelectboxJenisKerusakanState {}

class LoadingState extends SelectboxJenisKerusakanState {}

class SuccessState extends SelectboxJenisKerusakanState {
  final List<JenisKerusakanModel> listJenisKerusakan;
  SuccessState(this.listJenisKerusakan);
}

class ErrorState extends SelectboxJenisKerusakanState {}
