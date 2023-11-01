import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';

part 'apel_pagi_pengolahan_card_state.dart';

class ApelPagiPengolahanCardCubit extends Cubit<ApelPagiPengolahanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPagiPengolahanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsApelPagiPengolahanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<ApelPagiPengolahanFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataApelPagiPengolahanByTanggalOnlineOrOffline(
              taskDate.toString());
      if (cekData.isEmpty) {
        emit(IsApelPagiPengolahanAswered(false, null));
      } else {
        emit(IsApelPagiPengolahanAswered(true, cekData.first));
      }
    } else {
      // Jika Offline
      cekData = await localDataSource
          .getDataApelPagiPengolahanByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsApelPagiPengolahanAswered(false, null));
      } else {
        emit(IsApelPagiPengolahanAswered(true, cekData.first));
      }
    }
  }
}
