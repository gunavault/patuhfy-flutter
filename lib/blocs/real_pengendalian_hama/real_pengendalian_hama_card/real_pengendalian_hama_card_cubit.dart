import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_pemeliharaan_jalan_form_model.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';

part 'real_pengendalian_hama_card_state.dart';

class RealPengendalianHamaCardCubit extends Cubit<RealPengendalianHamaCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPengendalianHamaCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsRealPengendalianHamaAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<RealPengendalianHamaFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataRealPengendalianHamaByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPengendalianHamaAswered(false, null));
      } else {
        emit(IsRealPengendalianHamaAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataRealPengendalianHamaByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPengendalianHamaAswered(false, null));
      } else {
        emit(IsRealPengendalianHamaAswered(true, cekData.first));
      }
    }
  }
}
