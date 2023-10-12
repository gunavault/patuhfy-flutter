import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_penunasan_form_model.dart';

part 'real_penyiangan_card_state.dart';

class RealPenunasanCardCubit extends Cubit<RealPenunasanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPenunasanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsRealPenunasanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<RealPenunasanFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataRealPenunasanByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPenunasanAswered(false, null));
      } else {
        emit(IsRealPenunasanAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataRealPenunasanByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPenunasanAswered(false, null));
      } else {
        emit(IsRealPenunasanAswered(true, cekData.first));
      }
    }
  }
}
