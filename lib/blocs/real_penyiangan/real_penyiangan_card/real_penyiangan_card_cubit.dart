import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_penyiangan_form_model.dart';

part 'real_penyiangan_card_state.dart';

class RealPenyianganCardCubit extends Cubit<RealPenyianganCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPenyianganCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsRealPenyianganAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<RealPenyianganFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataRealPenyianganByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPenyianganAswered(false, null));
      } else {
        emit(IsRealPenyianganAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataRealPenyianganByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPenyianganAswered(false, null));
      } else {
        emit(IsRealPenyianganAswered(true, cekData.first));
      }
    }
  }
}
