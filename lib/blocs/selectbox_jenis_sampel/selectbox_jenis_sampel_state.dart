part of 'selectbox_jenis_sampel_cubit.dart';

@immutable
abstract class SelectboxJenisSampelState {}

class InitialSbJenisSampelState extends SelectboxJenisSampelState {}

class LoadingSbJenisSampelState extends SelectboxJenisSampelState {}

class SuccessSbJenisSampelState extends SelectboxJenisSampelState {
  final List<JenisSampelModel> listAllJenisSampel;
  SuccessSbJenisSampelState(this.listAllJenisSampel);
}

class SetParamSBState extends SelectboxJenisSampelState {
  final String namasampellosis;
  SetParamSBState(this.namasampellosis);
}

class ErrorSbJenisSampelState extends SelectboxJenisSampelState {}
