part of 'selectbox_mandorks_cubit.dart';

@immutable
abstract class SelectboxMandorState {}

class InitialSbMandorState extends SelectboxMandorState {}

class LoadingSbMandorState extends SelectboxMandorState {}

class SuccessSbMandorState extends SelectboxMandorState {
  final List<MandorModel> listAllMandor;
  SuccessSbMandorState(this.listAllMandor);
}

class SetParamSBState extends SelectboxMandorState {
  final String kodeAfd;
  SetParamSBState(this.kodeAfd);
}

class ErrorSbMandorState extends SelectboxMandorState {}
