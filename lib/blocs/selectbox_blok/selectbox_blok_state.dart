part of 'selectbox_blok_cubit.dart';

@immutable
abstract class SelectboxBlokState {}

class InitialSbBlokState extends SelectboxBlokState {}

class LoadingSbBlokState extends SelectboxBlokState {}

class SuccessSbBlokState extends SelectboxBlokState {
  final List<BlokModel> listAllBlok;
  SuccessSbBlokState(this.listAllBlok);
}

class SetParamSBState extends SelectboxBlokState {
  final String kodeAfd;
  SetParamSBState(this.kodeAfd);
}

class ErrorSbBlokState extends SelectboxBlokState {}
