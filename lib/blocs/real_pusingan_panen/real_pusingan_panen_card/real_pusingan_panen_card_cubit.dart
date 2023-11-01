import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_pusingan_panen_form_model.dart';
part 'real_pusingan_panen_card_state.dart';

class RealPusinganPanenCardCubit extends Cubit<RealPusinganPanenCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPusinganPanenCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsRealPusinganPanenAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<RealPusinganPanenFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection   post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataRealPusinganPanenByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPusinganPanenAswered(false, null));
      } else {
        emit(IsRealPusinganPanenAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataRealPusinganPanenByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPusinganPanenAswered(false, null));
      } else {
        emit(IsRealPusinganPanenAswered(true, cekData.first));
      }
    }
  }
}
