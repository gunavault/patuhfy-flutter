part of 'selectbox_kondisi_proses_cubit.dart';

@immutable
abstract class SelectboxKondisiProsesState {}

class InitialState extends SelectboxKondisiProsesState {}

class LoadingState extends SelectboxKondisiProsesState {}

class SuccessState extends SelectboxKondisiProsesState {
  final List<KondisiProsesModel> listKondisiProses;
  SuccessState(this.listKondisiProses);
}

class ErrorState extends SelectboxKondisiProsesState {}
