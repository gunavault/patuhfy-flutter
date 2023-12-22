part of 'analisa_kerusakan_alat_list_cubit.dart';

@immutable
abstract class AnalisaKerusakanAlatListState {}

class LoadingAnalisaKerusakanAlatListLState extends AnalisaKerusakanAlatListState {}

class SSAnalisaKerusakanAlatListLState extends AnalisaKerusakanAlatListState {}

class NoDataAnalisaKerusakanAlatListState extends AnalisaKerusakanAlatListState {
  final PelaporanKerusakanAlatFormModel dataFormPelaporanKerusakanAlat;
  final List<AnalisaKerusakanAlatModel> dataFormAnalisaKerusakanAlat;
  final UserModel userModel;

  NoDataAnalisaKerusakanAlatListState(
      this.dataFormPelaporanKerusakanAlat, this.dataFormAnalisaKerusakanAlat, this.userModel);
}

class SuccessAnalisaKerusakanAlatListState extends AnalisaKerusakanAlatListState {
  final PelaporanKerusakanAlatFormModel dataFormPelaporanKerusakanAlat;
  final List<AnalisaKerusakanAlatModel> dataFormAnalisaKerusakanAlat;
  final UserModel userModel;

  SuccessAnalisaKerusakanAlatListState(
      this.dataFormPelaporanKerusakanAlat, this.dataFormAnalisaKerusakanAlat, this.userModel);
}
