part of 'selectbox_jenis_kebersihan_cubit.dart';

@immutable
abstract class SelectboxJenisKebersihanState {}

class InitialState extends SelectboxJenisKebersihanState {}

class LoadingState extends SelectboxJenisKebersihanState {}

class SuccessState extends SelectboxJenisKebersihanState {
  final List<JenisKebersihanModel> listJenisKebersihan;
  SuccessState(this.listJenisKebersihan);
}

class ErrorState extends SelectboxJenisKebersihanState {}
