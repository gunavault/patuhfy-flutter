import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'lap_kerusakan_card_state.dart';

class LapKerusakanCardCubit extends Cubit<LapKerusakanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  LapKerusakanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsLapKerusakanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<LapKerusakanFormModel> cekData;
    cekData =
        await localDataSource.getDataLapKerusakanByTanggal(taskDate.toString());
    //Check if data offline exists
    print('cek lengh offline ada ga ${cekData.length}');
    if (cekData.length == 0) {
      // if not exist in offline then check online of exists then put to local
      cekData = await localDataSource
          .getDataLapKerusakanByTanggalOnlineOrOffline(taskDate.toString());
      // Cek data online
      print('cek lengh online ada ga ${cekData.length}');
      if (cekData.length == 0) {
        emit(IsLapKerusakanAswered(false, null));
      } else {
        emit(IsLapKerusakanAswered(true, cekData.first));
      }
    } else {
      emit(IsLapKerusakanAswered(true, cekData.first));
    }
  }
}
