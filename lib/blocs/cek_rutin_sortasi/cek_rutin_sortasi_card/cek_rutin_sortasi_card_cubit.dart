import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_card/cek_sampel_losis_card_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_card/estetika_pabrik_card_cubit.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/cek_monitoring_ipal.dart';
import 'package:patuhfy/models/cek_rutin_sortasi.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'cek_rutin_sortasi_card_state.dart';

class CekRutinSortasiCardCubit extends Cubit<CekRutinSortasiCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  CekRutinSortasiCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsCekRutinSortasiAswered(false, null));

  checkIsAnwered(String taskDate) async {
    // List<CekRutinSortasiFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await localDataSource.getCurrentUser();

      CekRutinSortasiFormModelSelectResponse response = await RemoteDataSource()
          .getCekRutinSortasiByTanggal(
              taskDate.toString(), userModel.nik_sap, userModel.token);
      print('data dari remote ${response.dataForm.length}');
      if (response.dataForm.length > 0) {
        print('kesini');
        emit(IsCekRutinSortasiAswered(true, response.dataForm.first));
      } else {
        emit(IsCekRutinSortasiAswered(false, null));
      }
    } else {
      // Jika Offline
      emit(IsCekRutinSortasiAswered(false, null));
    }
  }
}
