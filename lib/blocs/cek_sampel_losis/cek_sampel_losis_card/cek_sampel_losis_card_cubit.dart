import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_card/estetika_pabrik_card_cubit.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'cek_sampel_losis_card_state.dart';

class CekSampelLosisCardCubit extends Cubit<CekSampelLosisCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  CekSampelLosisCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsCekSampelLosisAswered(false, null));

  checkIsAnwered(String taskDate) async {
    // List<CekSampelLosisFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await localDataSource.getCurrentUser();

      CekSampelLosisFormModelSelectResponse response = await RemoteDataSource()
          .getCekSampelLosisByTanggal(
              taskDate.toString(), userModel.nik_sap, userModel.token);
      print('data dari remote ${response.dataForm.length}');
      if (response.dataForm.length > 0) {
        print('kesini');
        emit(IsCekSampelLosisAswered(true, response.dataForm.first));
      } else {
        emit(IsCekSampelLosisAswered(false, null));
      }
    } else {
      // Jika Offline
      emit(IsCekSampelLosisAswered(false, null));
    }
  }
}
