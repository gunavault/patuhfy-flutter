part of 'selectbox_blok_pengolahan_cubit.dart';

@immutable
abstract class SelectboxBlokPengolahanState {}

class InitialSbBlokPengolahanState extends SelectboxBlokPengolahanState {}

class LoadingSbBlokPengolahanState extends SelectboxBlokPengolahanState {}

class SuccessSbBlokPengolahanState extends SelectboxBlokPengolahanState {
  final List<BlokModel> listAllBlokPengolahan;
  SuccessSbBlokPengolahanState(this.listAllBlokPengolahan);
}

class SetParamSBState extends SelectboxBlokPengolahanState {
  final String kodepsa;
  final String kodeafd;
  SetParamSBState(this.kodepsa, this.kodeafd);
}

class ErrorSbBlokPengolahanState extends SelectboxBlokPengolahanState {}
