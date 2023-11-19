part of 'selectbox_stasiun_cubit.dart';

@immutable
abstract class SelectboxStasiunState {}

class InitialState extends SelectboxStasiunState {}

class LoadingState extends SelectboxStasiunState {}

class SuccessState extends SelectboxStasiunState {
  final List<StasiunModel> listStasiun;
  SuccessState(this.listStasiun);
}

class ErrorState extends SelectboxStasiunState {}
