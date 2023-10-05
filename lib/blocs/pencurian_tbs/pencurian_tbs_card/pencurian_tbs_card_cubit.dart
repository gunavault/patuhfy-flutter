import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';

part 'pencurian_tbs_card_state.dart';

class PencurianTbsCardCubit extends Cubit<PencurianTbsCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PencurianTbsCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsPencurianTbsAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<PencurianTbsFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataPencurianTbsByTanggalOnlineOrOffline(taskDate.toString());
      if (cekData.isEmpty) {
        emit(IsPencurianTbsAswered(false, null));
      } else {
        // Send to Database Server Holding
        emit(IsPencurianTbsAswered(true, cekData.first));
      }
    } else {
      cekData = await localDataSource
          .getDataPencurianTbsByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsPencurianTbsAswered(false, null));
      } else {
        emit(IsPencurianTbsAswered(true, cekData.first));
      }
    }
  }
}
