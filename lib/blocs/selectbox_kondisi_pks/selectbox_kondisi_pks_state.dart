part of 'selectbox_kondisi_pks_cubit.dart';

@immutable
abstract class SelectboxKondisiPksState {}

class InitialState extends SelectboxKondisiPksState {}

class LoadingState extends SelectboxKondisiPksState {}

class SuccessState extends SelectboxKondisiPksState {
  final List<KondisiPksModel> listKondisiPks;
  SuccessState(this.listKondisiPks);
}

class ErrorState extends SelectboxKondisiPksState {}
