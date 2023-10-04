import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'inspeksi_hanca_card_state.dart';

class InspeksiHancaCardCubit extends Cubit<InspeksiHancaCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  InspeksiHancaCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsInspeksiHancaAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<InspeksiHancaFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataInspeksiHancaByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.length == 0) {
        emit(IsInspeksiHancaAswered(false, null));
      } else {
        emit(IsInspeksiHancaAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataInspeksiHancaByTanggal(taskDate.toString());

      if (cekData.length == 0) {
        emit(IsInspeksiHancaAswered(false, null));
      } else {
        emit(IsInspeksiHancaAswered(true, cekData.first));
      }
    }
  }
}
