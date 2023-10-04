import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';

part 'inspeksi_tph_card_state.dart';

class InspeksiTphCardCubit extends Cubit<InspeksiTphCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  InspeksiTphCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsInspeksiTphAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<InspeksiTphFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataInspeksiTphByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.length == 0) {
        emit(IsInspeksiTphAswered(false, null));
      } else {
        emit(IsInspeksiTphAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataInspeksiTphByTanggal(taskDate.toString());

      if (cekData.length == 0) {
        emit(IsInspeksiTphAswered(false, null));
      } else {
        emit(IsInspeksiTphAswered(true, cekData.first));
      }
    }
  }
}
