import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'apel_pagi_card_state.dart';

class ApelPagiCardCubit extends Cubit<ApelPagiCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPagiCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsApelPagiAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<ApelPagiFormModel> cekData;
    cekData =
        await localDataSource.getDataApelPagiByTanggal(taskDate.toString());
    //Check if data offline exists
    print('cek lengh offline ada ga ${cekData.length}');
    if (cekData.length == 0) {
      // if not exist in offline then check online of exists then put to local
      cekData = await localDataSource
          .getDataApelPagiByTanggalOnlineOrOffline(taskDate.toString());
      // Cek data online
      print('cek lengh online ada ga ${cekData.length}');
      if (cekData.length == 0) {
        emit(IsApelPagiAswered(false, null));
      } else {
        emit(IsApelPagiAswered(true, cekData.first));
      }
    } else {
      emit(IsApelPagiAswered(true, cekData.first));
    }
  }
}
