import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_restan_form_model.dart';
part 'real_pemupukan_card_state.dart';

class RealRestanCardCubit extends Cubit<RealRestanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealRestanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsRealRestanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<RealRestanFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataRealRestanByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealRestanAswered(false, null));
      } else {
        emit(IsRealRestanAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataRealRestanByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealRestanAswered(false, null));
      } else {
        emit(IsRealRestanAswered(true, cekData.first));
      }
    }
  }
}
