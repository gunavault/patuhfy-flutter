part of 'pelaporan_kerusakan_alat_card_cubit.dart';

@immutable
abstract class PelaporanKerusakanAlatCardState {}

class InitialPelaporanKerusakanAlatCardState
    extends PelaporanKerusakanAlatCardState {}

class IsPelaporanKerusakanAlatAswered extends PelaporanKerusakanAlatCardState {
  final bool isAnswered;
  final PelaporanKerusakanAlatFormModel? dataForm;
  // final bool isSend;

  IsPelaporanKerusakanAlatAswered(this.isAnswered, this.dataForm);
}

class NoConnectionPelaporanKerusakanAlatCardState
    extends PelaporanKerusakanAlatCardState {}
