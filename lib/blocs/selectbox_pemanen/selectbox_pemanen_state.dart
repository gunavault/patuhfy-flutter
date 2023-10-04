part of 'selectbox_pemanen_cubit.dart';

@immutable
abstract class SelectboxPemanenState {}

class InitialSbPemanenState extends SelectboxPemanenState {}

class LoadingSbPemanenState extends SelectboxPemanenState {}

class SuccessSbPemanenState extends SelectboxPemanenState {
  final List<PemanenModel> listAllPemanen;
  SuccessSbPemanenState(this.listAllPemanen);
}

class SetParamSBState extends SelectboxPemanenState {
  final String kodeMandor;
  SetParamSBState(this.kodeMandor);
}

class ErrorSbPemanenState extends SelectboxPemanenState {}
