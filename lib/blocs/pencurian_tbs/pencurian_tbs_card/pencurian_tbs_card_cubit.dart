import 'package:bloc/bloc.dart';
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
    cekData =
        await localDataSource.getDataPencurianTbsByTanggal(taskDate.toString());
    //Check if data offline exists
    print('cek lengh offline ada ga ${cekData.length}');
    if (cekData.length == 0) {
      // if not exist in offline then check online of exists then put to local
      cekData = await localDataSource
          .getDataPencurianTbsByTanggalOnlineOrOffline(taskDate.toString());
      // Cek data online
      print('cek lengh online ada ga ${cekData.length}');
      if (cekData.length == 0) {
        emit(IsPencurianTbsAswered(false, null));
      } else {
        emit(IsPencurianTbsAswered(true, cekData.first));
      }
    } else {
      emit(IsPencurianTbsAswered(true, cekData.first));
    }
  }
}
