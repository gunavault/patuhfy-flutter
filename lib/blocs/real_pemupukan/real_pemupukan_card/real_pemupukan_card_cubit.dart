import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';

part 'real_pemupukan_card_state.dart';

class RealPemupukanCardCubit extends Cubit<RealPemupukanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPemupukanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsRealPemupukanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<RealPemupukanFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataRealPemupukanByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPemupukanAswered(false, null));
      } else {
        emit(IsRealPemupukanAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataRealPemupukanByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPemupukanAswered(false, null));
      } else {
        emit(IsRealPemupukanAswered(true, cekData.first));
      }
    }
  }
}
