import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';

part 'apel_pagi_card_state.dart';

class ApelPagiCardCubit extends Cubit<ApelPagiCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPagiCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsApelPagiAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<ApelPagiFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataApelPagiByTanggalOnlineOrOffline(taskDate.toString());
      if (cekData.length == 0) {
        emit(IsApelPagiAswered(false, null));
      } else {
        emit(IsApelPagiAswered(true, cekData.first));
      }
    } else {
      // Jika Offline
      cekData =
          await localDataSource.getDataApelPagiByTanggal(taskDate.toString());

      if (cekData.length == 0) {
        emit(IsApelPagiAswered(false, null));
      } else {
        emit(IsApelPagiAswered(true, cekData.first));
      }
    }
  }
}
