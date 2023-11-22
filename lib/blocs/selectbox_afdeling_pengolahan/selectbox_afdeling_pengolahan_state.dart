part of 'selectbox_afdeling_pengolahan_cubit.dart';

@immutable
abstract class SelectboxAfdelingPengolahanState {}

class InitialSbAfdelingPengolahanState extends SelectboxAfdelingPengolahanState {}

class LoadingSbAfdelingPengolahanState extends SelectboxAfdelingPengolahanState {}

class SuccessSbAfdelingPengolahanState extends SelectboxAfdelingPengolahanState {
  final List<AfdelingModel> listAllAfdelingPengolahan;
  SuccessSbAfdelingPengolahanState(this.listAllAfdelingPengolahan);
}

class SetParamSBState extends SelectboxAfdelingPengolahanState {
  final String kodepsa;
  SetParamSBState(this.kodepsa);
}

class ErrorSbAfdelingPengolahanState extends SelectboxAfdelingPengolahanState {}
