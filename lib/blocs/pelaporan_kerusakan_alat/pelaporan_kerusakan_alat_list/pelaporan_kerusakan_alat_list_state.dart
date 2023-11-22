part of 'pelaporan_kerusakan_alat_list_cubit.dart';

@immutable
abstract class PelaporanKerusakanAlatListState {}

class LoadingPelaporanKerusakanAlatListState
    extends PelaporanKerusakanAlatListState {}

class NoDataPelaporanKerusakanAlatListState
    extends PelaporanKerusakanAlatListState {
  // final RtlListModel dataFormRtl;
  final List<PelaporanKerusakanAlatFormModel> dataFormPelaporanKerusakanAlat;
  final UserModel userModel;

  NoDataPelaporanKerusakanAlatListState(
      this.dataFormPelaporanKerusakanAlat, this.userModel);
}

class SuccessPelaporanKerusakanAlatListState
    extends PelaporanKerusakanAlatListState {
  final List<PelaporanKerusakanAlatFormModel> dataForm;
  final UserModel userModel;

  SuccessPelaporanKerusakanAlatListState(this.dataForm, this.userModel);
}

class ErrorPelaporanKerusakanAlatListState
    extends PelaporanKerusakanAlatListState {}

class NoConnectionPelaporanKerusakanAlatListState
    extends PelaporanKerusakanAlatListState {}
