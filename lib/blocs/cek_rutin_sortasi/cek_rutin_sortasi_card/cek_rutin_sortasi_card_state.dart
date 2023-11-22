part of 'cek_rutin_sortasi_card_cubit.dart';

@immutable
abstract class CekRutinSortasiCardState {}

class InitialCekRutinSortasiCardState extends CekRutinSortasiCardState {}

class IsCekRutinSortasiAswered extends CekRutinSortasiCardState {
  final bool isAnswered;
  final CekRutinSortasiFormModel? dataForm;
  // final bool isSend;

  IsCekRutinSortasiAswered(this.isAnswered, this.dataForm);
}

class NoConnectionCekRutinSortasiCardState extends CekRutinSortasiCardState {}
