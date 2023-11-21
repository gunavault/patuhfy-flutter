import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_card/cek_sampel_losis_card_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_card/estetika_pabrik_card_cubit.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/cek_monitoring_ipal.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'cek_monitoring_ipal_card_state.dart';

class CekMonitoringIpalCardCubit extends Cubit<CekMonitoringIpalCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  CekMonitoringIpalCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsCekMonitoringIpalAswered(false, null));

  checkIsAnwered(String taskDate) async {
    // List<CekMonitoringIpalFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await localDataSource.getCurrentUser();

      CekMonitoringIpalFormModelSelectResponse response = await RemoteDataSource()
          .getCekMonitoringIpalByTanggal(
              taskDate.toString(), userModel.nik_sap, userModel.token);
      print('data dari remote ${response.dataForm.length}');
      if (response.dataForm.length > 0) {
        print('kesini');
        emit(IsCekMonitoringIpalAswered(true, response.dataForm.first));
      } else {
        emit(IsCekMonitoringIpalAswered(false, null));
      }
    } else {
      // Jika Offline
      emit(IsCekMonitoringIpalAswered(false, null));
    }
  }
}
