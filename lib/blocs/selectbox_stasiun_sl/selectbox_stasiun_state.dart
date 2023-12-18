part of 'selectbox_stasiun_cubit.dart';

@immutable
abstract class SelectboxStasiunSLState {}

class InitialState extends SelectboxStasiunSLState {}

class LoadingState extends SelectboxStasiunSLState {}

class SuccessState extends SelectboxStasiunSLState {
  final List<StasiunModel> listStasiun;
  SuccessState(this.listStasiun);
}

class ErrorState extends SelectboxStasiunSLState {}
