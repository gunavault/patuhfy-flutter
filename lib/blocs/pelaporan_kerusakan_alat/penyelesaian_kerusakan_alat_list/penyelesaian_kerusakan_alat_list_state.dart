part of 'penyelesaian_kerusakan_alat_list_cubit.dart';

@immutable
abstract class PenyelesaianKerusakanAlatListState {}

class LoadingPenyelesaianKerusakanAlatListLState extends PenyelesaianKerusakanAlatListState {}

class SSPenyelesaianKerusakanAlatListLState extends PenyelesaianKerusakanAlatListState {}

class NoDataPenyelesaianKerusakanAlatListState extends PenyelesaianKerusakanAlatListState {
  final PelaporanKerusakanAlatFormModel dataFormPelaporanKerusakanAlat;
  final List<PenyelesaianKerusakanAlatModel> dataFormPenyelesaianKerusakanAlat;
  final UserModel userModel;

  NoDataPenyelesaianKerusakanAlatListState(
      this.dataFormPelaporanKerusakanAlat, this.dataFormPenyelesaianKerusakanAlat, this.userModel);
}

class SuccessPenyelesaianKerusakanAlatListState extends PenyelesaianKerusakanAlatListState {
  final PelaporanKerusakanAlatFormModel dataFormPelaporanKerusakanAlat;
  final List<PenyelesaianKerusakanAlatModel> dataFormPenyelesaianKerusakanAlat;
  final UserModel userModel;

  SuccessPenyelesaianKerusakanAlatListState(
      this.dataFormPelaporanKerusakanAlat, this.dataFormPenyelesaianKerusakanAlat, this.userModel);
}
