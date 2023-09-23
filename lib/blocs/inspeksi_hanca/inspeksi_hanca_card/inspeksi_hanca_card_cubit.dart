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
    cekData = await localDataSource
        .getDataInspeksiHancaByTanggal(taskDate.toString());
    //Check if data offline exists
    print('cek lengh offline ada ga ${cekData.length}');
    if (cekData.length == 0) {
      // if not exist in offline then check online of exists then put to local
      cekData = await localDataSource
          .getDataInspeksiHancaByTanggalOnlineOrOffline(taskDate.toString());
      // Cek data online
      print('cek lengh online ada ga ${cekData.length}');
      if (cekData.length == 0) {
        emit(IsInspeksiHancaAswered(false, null));
      } else {
        emit(IsInspeksiHancaAswered(true, cekData.first));
      }
    } else {
      emit(IsInspeksiHancaAswered(true, cekData.first));
    }
  }
}
