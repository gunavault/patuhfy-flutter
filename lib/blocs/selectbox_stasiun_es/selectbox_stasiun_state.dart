part of 'selectbox_stasiun_cubit.dart';

@immutable
abstract class SelectboxStasiunESState {}

class InitialState extends SelectboxStasiunESState {}

class LoadingState extends SelectboxStasiunESState {}

class SuccessState extends SelectboxStasiunESState {
  final List<StasiunModel> listStasiun;
  SuccessState(this.listStasiun);
}

class ErrorState extends SelectboxStasiunESState {}
